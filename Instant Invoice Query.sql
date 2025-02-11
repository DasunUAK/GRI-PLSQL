SELECT t.invoice_no,t.invoice_type,t.identity,q.object_id,q.description,q.quantity,q.price,t.invoice_date
FROM INSTANT_INVOICE t
INNER JOIN INSTANT_INVOICE_ITEM q on t.invoice_id = q.invoice_id
WHERE t.invoice_date Between to_date( '&From_Date', 'DD-MM-YYYY' ) 
AND to_date( '&To_Date', 'DD-MM-YYYY' )
Order by t.invoice_no
