select r.invoicing_supplier,s.name,t.SOURCE_REF1 as PO,t.RECEIPT_REFERENCE,t.RECEIPT_NO,t.SOURCE_PART_NO,r.buy_unit_price,t.INV_QTY_ARRIVED,r.buy_unit_price*t.INV_QTY_ARRIVED total 
from Receipt_Info_Cfv t
Inner join Inventory_Part q on t.SOURCE_PART_NO = q.part_no
inner join Purchase_Order_Line r on t.SOURCE_REF1 = r.order_no and t.SOURCE_PART_NO = r.part_no
left join supplier_info s on r.invoicing_supplier = s.supplier_id
where q.part_product_code = 'RM' and t.SOURCE_REF1 = '1000'
Group by t.SOURCE_REF1,t.RECEIPT_REFERENCE,t.RECEIPT_NO,t.SOURCE_PART_NO,r.buy_unit_price,t.INV_QTY_ARRIVED,r.invoicing_supplier,s.name
Order by t.SOURCE_REF1,t.SOURCE_PART_NO,t.RECEIPT_NO
