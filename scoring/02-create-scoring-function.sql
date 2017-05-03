CREATE FUNCTION stack_rows(
    key text,
    header text[], -- name of the features column
    features float8[] -- independent variables (as array)
    )
RETURNS text AS
$$
    if 'header' not in GD:
        GD['header'] = header
    if not key:
        gd_key = 'stack_rows'
        GD[gd_key] = [features]
        return gd_key
    else:
        GD[key].append(features)
        return key
$$
LANGUAGE plpythonu;

CREATE ORDERED AGGREGATE stack_rows(
        text[], -- header (feature names)
        float8[] -- features (feature values)
        )
(
    SFUNC = stack_rows,
    STYPE = text -- the key in GD used to hold the data across calls
);

CREATE OR REPLACE FUNCTION score_keras(
    _model text,
    _data_key text
    )
RETURNS SETOF INTEGER[] AS
$$
    # Begin: Workaround to import TensorFlow
    import sys

    sys.argv = {0: ""}
    __file__ = ""
    # End: Workaround to import TensorFlow

    if 'model' not in SD:
        from keras.models import load_model
        SD['model'] = load_model(_model)

    result = None
    if _data_key in GD:
        result = SD['model'].predict_classes(GD[_data_key])
        del GD[_data_key]

    return result
$$
LANGUAGE plpythonu IMMUTABLE;
