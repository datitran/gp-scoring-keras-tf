WITH cached_data AS (
SELECT
    gp_segment_id,
    stack_rows(
    ARRAY['features'], -- header or names of input fields
    ARRAY[v1, v2, v3, v4, v5, v6, v7,
          v8, v9, v10, v11, v12, v13, v14,
          v15, v16, v17, v18, v19, v20, v21,
          v22, v23, v24, v25, v26, v27, v28] -- feature vector
    ) AS stacked_input_key
FROM
    credit_card
GROUP BY
    gp_segment_id
)

SELECT
    score_keras(
        '/home/gpadmin/model_file.h5', -- full path of the model
        stacked_input_key -- table name containing data to score
    ) AS results
FROM
    cached_data;
