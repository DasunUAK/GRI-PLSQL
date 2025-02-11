SELECT 
C_Date as "Create Date",Plan,Actual,Round(Actual*100/Plan) as "Plan vs Actual"
FROM
(SELECT SUM(t.qty_complete) as Actual,to_date(t.close_date,'DD/MM/YYYY'),q.CF$_DATE C_Date1 FROM
Shop_ord t 
inner join DAILY_TBM_UPDATE_CLV q on T.order_no = q.CF$_SONUMBER
and to_date(t.close_date,'DD/MM/YYYY') = to_date(q.CF$_DATE,'DD/MM/YYYY')
Group by to_date(t.close_date,'DD/MM/YYYY'),q.CF$_DATE)T0
Inner join
(Select SUM(c.CF$_QTY) Plan,c.CF$_DATE C_Date
From DAILY_TBM_UPDATE_CLV c
Group by c.CF$_DATE 
)T1 ON T0.C_Date1 = T1.C_Date
Order By C_Date
