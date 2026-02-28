CREATE TABLE clean_accepted AS
SELECT
    CASE 
        WHEN loan_amnt REGEXP '^[0-9.]+$'
        THEN CAST(loan_amnt AS DECIMAL(12,2))
        ELSE NULL
    END AS loan_amnt,

    CASE 
        WHEN term LIKE '%months%'
        THEN CAST(REPLACE(term,' months','') AS UNSIGNED)
        ELSE NULL
    END AS term_months,

    CASE 
        WHEN int_rate REGEXP '^[0-9.]+$'
        THEN CAST(int_rate AS DECIMAL(5,2))
        ELSE NULL
    END AS int_rate,

    CASE 
        WHEN annual_inc REGEXP '^[0-9.]+$'
        THEN CAST(annual_inc AS DECIMAL(15,2))
        ELSE NULL
    END AS annual_inc,

    CASE
    WHEN fico_range_low IS NOT NULL AND fico_range_low != ''
    THEN CAST(fico_range_low AS DECIMAL(5,1))
    ELSE NULL
	END AS fico_low,

    CASE
        WHEN fico_range_high IS NOT NULL AND fico_range_high!= ''
        THEN CAST(fico_range_high AS DECIMAL(5,1))
        ELSE NULL
		END AS fico_high,

    CASE
        WHEN dti REGEXP '^[0-9.]+$'
        THEN CAST(dti AS DECIMAL(6,2))
        ELSE NULL
    END AS dti,

    grade,
    home_ownership,
    addr_state,

    CASE 
        WHEN total_rec_int REGEXP '^[0-9.]+$'
        THEN CAST(total_rec_int AS DECIMAL(15,2))
        ELSE NULL
    END AS total_rec_int,

    CASE 
        WHEN total_rec_prncp REGEXP '^[0-9.]+$'
        THEN CAST(total_rec_prncp AS DECIMAL(15,2))
        ELSE NULL
    END AS total_rec_prncp,

    CASE 
        WHEN recoveries REGEXP '^[0-9.]+$'
        THEN CAST(recoveries AS DECIMAL(15,2))
        ELSE NULL
    END AS recoveries,

    loan_status,

    CASE 
        WHEN loan_status = 'Charged Off' THEN 1
        WHEN loan_status = 'Fully Paid' THEN 0
    END AS default_flag

FROM raw_accepted
WHERE loan_status IN ('Fully Paid','Charged Off');
