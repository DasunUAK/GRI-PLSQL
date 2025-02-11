SELECT c.order_no,C.PArt_No,C.COM_Part Issue_Com_Part,(c.quantity/p.quantity) Issue_qty,z.component_part BOM_Com_Part,Z.qty_per_assembly BOM_Qty FROM

(Select t.order_no,t.part_no as Com_part,q.part_no,q.quantity
From
Shop_Ord t
inner join INVENTORY_TRANSACTION_HIST2 q on t.order_no = q.source_ref1
where t.date_entered between to_date( '&From_Date', 'DD-MM-YYYY' ) AND to_date( '&To_Date', 'DD-MM-YYYY' )
and q.transaction_code = 'OOREC'
Group by t.order_no,t.part_no,q.part_no,q.quantity)p
INNER JOIN
(Select a.order_no order_no,a.part_no part_no,b.part_no as Com_part,SUM(b.quantity) quantity,a.date_entered
From
Shop_Ord a
left join INVENTORY_TRANSACTION_HIST2 b on a.order_no = b.source_ref1

where b.transaction_code = 'BACFLUSH'and
a.date_entered between to_date( '&From_Date', 'DD-MM-YYYY' ) AND to_date( '&To_Date', 'DD-MM-YYYY' )
group by a.order_no,a.part_no,b.part_no,a.date_entered)c on p.order_no = c.order_no
INNER JOIN
(SELECT
l.part_no,n.component_part,n.qty_per_assembly,m.eng_chg_level
FROM
PROD_STRUCTURE_HEAD l
inner join PROD_STRUCT_ALTERNATE m on l.part_no = m.part_no
inner join PROD_STRUCTURE n on m.part_no = n.part_no
where l.eff_phase_out_date is null and m.state = 'Buildable' and n.eff_phase_out_date is null
and l.bom_type = 'Manufacturing' AND n.bom_type = 'Manufacturing')Z on p.part_no = z.part_no and c.Com_part = Z.component_part

Inner join inventory_part f on  p.Part_no = f.part_no
where c.date_entered between to_date( '&From_Date', 'DD-MM-YYYY' ) AND to_date( '&To_Date', 'DD-MM-YYYY' )
--and f.part_product_family = 'GCM' 
--and p.order_no = '617850'
Group by
c.order_no,C.PArt_No,C.COM_Part,z.component_part,c.quantity,p.quantity,Z.qty_per_assembly

