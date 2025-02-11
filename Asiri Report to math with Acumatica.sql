select

 

a.CF$_SHIPMENT_ID,a.ORDER_NO,

 

case

  when a.IDENTITY in ('CS0193','CS0197') then a.CF$_C_SHIPMENT_CUSTOMER

  when a.IDENTITY not in ('CS0193','CS0197','CS0286') then a.IDENTITY

  when a.IDENTITY = 'CS0286' then SHIPMENT_API.Get_Ship_Addr_No(a.CF$_SHIPMENT_ID) END AS Cus_Code, 

 

a.CATALOG_NO,p.Qty - case when(K.QtyR is null) then 0 else K.QtyR end as Qty,P.COST

 

--a.CF$_QTY,

--a.CF$_TOTAL_COST

 

 

from CUSTOMER_ORDER_INV_JOIN_CFV a

INNER JOIN

(Select t.part_no,Count(t.part_no) as Qty,t.source_ref1,q.SHIPMENT_ID,SUM(t.cost) as Cost

FROM

INVENTORY_TRANSACTION_HIST2 t

inner join CUSTOMER_ORDER_DELIVERY_JOIN q on t.source_ref1 = q.order_no AND t.part_no = q.catalog_no AND t.source_ref5 = q.deliv_no

where t.transaction_code = 'OESHIP' --and t.source_ref1 = 'S7936'

Group by t.part_no,t.source_ref1,q.SHIPMENT_ID)P ON a.CATALOG_NO = P.Part_No AND a.ORDER_NO = P.source_ref1 AND a.CF$_SHIPMENT_ID = P.Shipment_Id

Left Join
(Select t.part_no,Count(t.part_no) as QtyR,t.source_ref1,q.SHIPMENT_ID,SUM(t.cost) as Cost

FROM

INVENTORY_TRANSACTION_HIST2 t

inner join CUSTOMER_ORDER_DELIVERY_JOIN q on t.source_ref1 = q.order_no AND t.part_no = q.catalog_no AND t.source_ref5 = q.deliv_no

where t.transaction_code = 'OEUNSHIP' --and t.source_ref1 = 'S7936'

Group by t.part_no,t.source_ref1,q.SHIPMENT_ID)K ON a.CATALOG_NO = K.Part_No AND a.ORDER_NO = K.source_ref1 AND a.CF$_SHIPMENT_ID = K.Shipment_Id

where

a.COMPANY = 'GRISL' and a.CONTRACT = 'GRI01' and a.IDENTITY = 'CS0286' and

a.CF$_ITEM_TYPE is not null and a.SERIES_ID = 'CD' and

trunc(a.INVOICE_DATE) between to_date('&From_Date', 'YYYYMMDD') and to_date('&To_Date', 'YYYYMMDD')

 

order by a.CF$_SHIPMENT_ID,a.ORDER_NO,p.Qty
