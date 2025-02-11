Select * From
(
select t.order_no ON1,t.part_no p1,q.part_no P2,r.lot_batch_no LOT1 from Shop_Ord t
inner join SHOP_MATERIAL_ALLOC q on t.order_no = q.order_no
Inner Join Inventory_Transaction_Hist2 r on q.order_no= r.source_ref1 and q.part_no = r.part_no and r.transaction_code= 'BACFLUSH'
)T0
Left Join
(select t.source_ref1 ON2,t.part_no P3,t.lot_batch_no LOT2
from Inventory_Transaction_Hist2 t 
where t.transaction_code= 'OOREC')T2 ON T0.LOT1 = T2.LOT2
Left Join
(
select t.order_no ON3,t.part_no P4,q.part_no P5,r.lot_batch_no LOT3,s.part_product_family PPF1,u.source_ref1 ON4 from Shop_Ord t
inner join SHOP_MATERIAL_ALLOC q on t.order_no = q.order_no
Inner Join Inventory_Transaction_Hist2 r on q.order_no= r.source_ref1 and q.part_no = r.part_no and r.transaction_code in ('BACFLUSH','SOISS')
inner join Inventory_part s on r.part_no = s.part_no
inner join Inventory_Transaction_Hist2 u on r.part_no = u.part_no and r.lot_batch_no = u.lot_batch_no and u.transaction_code = 'OOREC'
--where t.order_no = '191526'
Group by t.order_no,t.part_no,q.part_no,r.lot_batch_no,s.part_product_family,u.source_ref1) T3 ON T2.ON2 = T3.ON3

Left Join
(
select t.order_no ON5,t.part_no P6,q.part_no P7,r.lot_batch_no LOT4,s.part_product_family PPF2,u.source_ref1 ON6 from Shop_Ord t
inner join SHOP_MATERIAL_ALLOC q on t.order_no = q.order_no
Inner Join Inventory_Transaction_Hist2 r on q.order_no= r.source_ref1 and q.part_no = r.part_no and r.transaction_code in ('BACFLUSH','SOISS')
inner join Inventory_part s on r.part_no = s.part_no
Left join Inventory_Transaction_Hist2 u on r.part_no = u.part_no and r.lot_batch_no = u.lot_batch_no and u.transaction_code = 'OOREC'

Group by t.order_no,t.part_no,q.part_no,r.lot_batch_no,s.part_product_family,u.source_ref1)T4 ON T3.ON4 = T4.ON5


Left Join
(
select t.order_no ON7,t.part_no P8,q.part_no P9,r.lot_batch_no LOT5,s.part_product_family PPF3,u.source_ref1 ON8 from Shop_Ord t
inner join SHOP_MATERIAL_ALLOC q on t.order_no = q.order_no
Inner Join Inventory_Transaction_Hist2 r on q.order_no= r.source_ref1 and q.part_no = r.part_no and r.transaction_code in ('BACFLUSH','SOISS')
inner join Inventory_part s on r.part_no = s.part_no
Left join Inventory_Transaction_Hist2 u on r.part_no = u.part_no and r.lot_batch_no = u.lot_batch_no and u.transaction_code = 'OOREC'

Group by t.order_no,t.part_no,q.part_no,r.lot_batch_no,s.part_product_family,u.source_ref1)T5 ON T4.ON6 = T5.ON7

left join

(
select t.order_no ON9,t.part_no P10,q.part_no P11,r.lot_batch_no LOT6,s.part_product_family PPF4,u.source_ref1 ON10 from Shop_Ord t
inner join SHOP_MATERIAL_ALLOC q on t.order_no = q.order_no
Inner Join Inventory_Transaction_Hist2 r on q.order_no= r.source_ref1 and q.part_no = r.part_no and r.transaction_code in ('BACFLUSH','SOISS')
inner join Inventory_part s on r.part_no = s.part_no
Left join Inventory_Transaction_Hist2 u on r.part_no = u.part_no and r.lot_batch_no = u.lot_batch_no and u.transaction_code = 'OOREC'

Group by t.order_no,t.part_no,q.part_no,r.lot_batch_no,s.part_product_family,u.source_ref1)T6 ON T5.ON8 = T6.ON9

left join

(
select t.order_no ON11,t.part_no P12,q.part_no P13,r.lot_batch_no LOT7,s.part_product_family PPF5,u.source_ref1 ON12 from Shop_Ord t
inner join SHOP_MATERIAL_ALLOC q on t.order_no = q.order_no
Inner Join Inventory_Transaction_Hist2 r on q.order_no= r.source_ref1 and q.part_no = r.part_no and r.transaction_code in ('BACFLUSH','SOISS')
inner join Inventory_part s on r.part_no = s.part_no
Left join Inventory_Transaction_Hist2 u on r.part_no = u.part_no and r.lot_batch_no = u.lot_batch_no and u.transaction_code = 'OOREC'

Group by t.order_no,t.part_no,q.part_no,r.lot_batch_no,s.part_product_family,u.source_ref1)T7 ON T6.ON10 = T7.ON11

left join

(
select t.order_no ON13,t.part_no P14,q.part_no P15,r.lot_batch_no LOT8,s.part_product_family PPF6,u.source_ref1 ON14 from Shop_Ord t
inner join SHOP_MATERIAL_ALLOC q on t.order_no = q.order_no
Inner Join Inventory_Transaction_Hist2 r on q.order_no= r.source_ref1 and q.part_no = r.part_no and r.transaction_code in ('BACFLUSH','SOISS')
inner join Inventory_part s on r.part_no = s.part_no
Left join Inventory_Transaction_Hist2 u on r.part_no = u.part_no and r.lot_batch_no = u.lot_batch_no and u.transaction_code = 'OOREC'

Group by t.order_no,t.part_no,q.part_no,r.lot_batch_no,s.part_product_family,u.source_ref1)T8 ON T7.ON12 = T8.ON13

left join

(
select t.order_no ON15,t.part_no P16,q.part_no P17,r.lot_batch_no LOT9,s.part_product_family PPF7,u.source_ref1 ON16 from Shop_Ord t
inner join SHOP_MATERIAL_ALLOC q on t.order_no = q.order_no
Inner Join Inventory_Transaction_Hist2 r on q.order_no= r.source_ref1 and q.part_no = r.part_no and r.transaction_code in ('BACFLUSH','SOISS')
inner join Inventory_part s on r.part_no = s.part_no
Left join Inventory_Transaction_Hist2 u on r.part_no = u.part_no and r.lot_batch_no = u.lot_batch_no and u.transaction_code = 'OOREC'

Group by t.order_no,t.part_no,q.part_no,r.lot_batch_no,s.part_product_family,u.source_ref1)T9 ON T8.ON14 = T9.ON15

left join

(
select t.order_no ON17,t.part_no P18,q.part_no P19,r.lot_batch_no LOT10,s.part_product_family PPF8,u.source_ref1 ON18 from Shop_Ord t
inner join SHOP_MATERIAL_ALLOC q on t.order_no = q.order_no
Inner Join Inventory_Transaction_Hist2 r on q.order_no= r.source_ref1 and q.part_no = r.part_no and r.transaction_code in ('BACFLUSH','SOISS')
inner join Inventory_part s on r.part_no = s.part_no
Left join Inventory_Transaction_Hist2 u on r.part_no = u.part_no and r.lot_batch_no = u.lot_batch_no and u.transaction_code = 'OOREC'

Group by t.order_no,t.part_no,q.part_no,r.lot_batch_no,s.part_product_family,u.source_ref1)T10 ON T9.ON16 = T10.ON17

WHERE T0.ON1 = '191685'
