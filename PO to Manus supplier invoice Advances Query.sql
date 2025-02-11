Select t.ORDER_NO,q.invoice_no,q.CF$_ADV_AMT From
Purchase_Order_Cfv t 
inner join MAN_SUPP_INVOICE_CFV q on t.ORDER_NO = q.po_ref_number
where t.state = 'Released' and t.ORDER_NO like 'P%'
Group by t.ORDER_NO,q.invoice_no,q.CF$_ADV_AMT
