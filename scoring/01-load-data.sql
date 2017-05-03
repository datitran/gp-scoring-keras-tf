CREATE TABLE credit_card(
    Time NUMERIC, -- seconds elapsed between each transaction
    V1 NUMERIC, -- first principal component
    V2 NUMERIC, -- second principal component
    V3 NUMERIC, -- third principal component
    V4 NUMERIC,
    V5 NUMERIC,
    V6 NUMERIC,
    V7 NUMERIC,
    V8 NUMERIC,
    V9 NUMERIC,
    V10 NUMERIC,
    V11 NUMERIC,
    V12 NUMERIC,
    V13 NUMERIC,
    V14 NUMERIC,
    V15 NUMERIC,
    V16 NUMERIC,
    V17 NUMERIC,
    V18 NUMERIC,
    V19 NUMERIC,
    V20 NUMERIC,
    V21 NUMERIC,
    V22 NUMERIC,
    V23 NUMERIC,
    V24 NUMERIC,
    V25 NUMERIC,
    V26 NUMERIC,
    V27 NUMERIC,
    V28 NUMERIC, -- twenty-eighth principal component
    Amount NUMERIC, -- transaction amount
    Class NUMERIC -- the actual classification classes
    )
WITH ( APPENDONLY=TRUE, COMPRESSTYPE=zlib, COMPRESSLEVEL=5 )
DISTRIBUTED RANDOMLY;

COPY credit_card FROM '/home/gpadmin/creditcard.csv' CSV HEADER;