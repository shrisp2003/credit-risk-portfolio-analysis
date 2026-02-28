-- Portfolio Overview Metrics
-- Total Loans
SELECT COUNT(*) AS total_loans
FROM clean_accepted;

-- Total Loan Amount (Exposure)
SELECT SUM(loan_amnt) AS total_exposure
FROM clean_accepted;

-- Default Rate
SELECT 
    AVG(default_flag) AS default_rate
FROM clean_accepted;

-- Net Profit
SELECT 
    SUM(total_rec_int) - 
    SUM(loan_amnt - total_rec_prncp) AS net_profit
FROM clean_accepted;

-- Risk Segmentation
-- Confirm Default Distribution
SELECT
	default_flag,
    ROUND(COUNT(*) *100/ (SELECT COUNT(*) FROM clean_accepted), 2) as percentage
FROM clean_accepted
GROUP BY default_flag;    

-- Grade-wise Default Rate
SELECT 
    grade,
    COUNT(*) AS total_loans,
    SUM(default_flag) AS total_defaults,
    ROUND(SUM(default_flag) / COUNT(*) * 100, 2) AS default_rate
FROM clean_accepted
GROUP BY grade
ORDER BY default_rate DESC;

-- State-wise Risk
SELECT 
    addr_state,
    COUNT(*) AS total_loans,
    ROUND(SUM(default_flag)/COUNT(*) * 100,2) AS default_rate
FROM clean_accepted
GROUP BY addr_state
ORDER BY default_rate DESC
LIMIT 10;

-- Profitability Analysis
-- Calculate Portfolio-Level Profit
SELECT
    ROUND(SUM(total_rec_int),2) AS total_interest_earned,
    ROUND(SUM(loan_amnt - total_rec_prncp),2) AS total_principal_loss,
    ROUND(SUM(total_rec_int) - SUM(loan_amnt - total_rec_prncp),2) AS net_profit
FROM clean_accepted;

-- Profitability by Grade
SELECT
    grade,
    COUNT(*) AS total_loans,
    ROUND(SUM(total_rec_int),2) AS interest_earned,
    ROUND(SUM(loan_amnt - total_rec_prncp),2) AS principal_loss,
    ROUND(
        SUM(total_rec_int) - SUM(loan_amnt - total_rec_prncp),
    2) AS net_profit
FROM clean_accepted
GROUP BY grade
ORDER BY net_profit DESC;

-- Profit by Default vs Non-Default
SELECT
    default_flag,
    COUNT(*) AS total_loans,
    ROUND(SUM(total_rec_int),2) AS interest_earned,
    ROUND(SUM(loan_amnt - total_rec_prncp),2) AS principal_loss,
    ROUND(
        SUM(total_rec_int) - SUM(loan_amnt - total_rec_prncp),
    2) AS net_profit
FROM clean_accepted
GROUP BY default_flag;

-- Risk-Adjusted Return Ratio
SELECT
    ROUND(SUM(total_rec_int) / SUM(loan_amnt) * 100,2) AS interest_return_pct,
    ROUND(SUM(loan_amnt - total_rec_prncp) / SUM(loan_amnt) * 100,2) AS loss_pct
FROM clean_accepted;
