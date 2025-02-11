SELECT p.PART_NO--,p.component_part,l.total_accum_cost,p.qty_per_assembly
,SUM(l.total_accum_cost*p.qty_per_assembly) as BOM_COST,n.total_accum_cost as Part_Cost
FROM PROD_STRUCTURE p
INNER JOIN PART_COST l on p.component_part = l.part_no and l.cost_set = 1
INNER JOIN PART_COST n on p.part_no = n.part_no and n.cost_set = 1
where  p.eff_phase_out_date is null AND p.alternative_no = '*' --AND p.part_no = 'CAPAR5015'
Group By
p.PART_NO--,l.total_accum_cost,p.qty_per_assembly--,p.component_part
,n.total_accum_cost
