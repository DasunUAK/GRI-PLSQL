SELECT t.part_no,r.description as Part_Description,r.unit_meas,Inventory_Part_API.Get_Weight_Net(t.CONTRACT,t.PART_NO) as Standard_Weight ,q.CF$_KG_PER_UOM as BOM_WEIGHT,
(Inventory_Part_API.Get_Weight_Net(t.CONTRACT,t.PART_NO) - q.CF$_KG_PER_UOM) as Variance
FROM PROD_STRUCTURE_HEAD t
INNER JOIN PROD_STRUCT_ALTERNATE_CFV q on t.part_no = q.part_no AND t.eng_chg_level = q.eng_chg_level AND q.state = 'Buildable'
INNER JOIN INVENTORY_PART r ON t.part_no = r.part_no 
INNER JOIN SALES_PART s on t.part_no = s.part_no AND t.part_no = s.catalog_no
WHERE t.eff_phase_out_date is null AND s.contract = 'GRI01' AND t.bom_type_db = 'M' AND q.BOM_TYPE_DB = 'M' AND r.contract = 'GRI01'
--AND t.part_no = 'PAB1293' 
AND t.note_id = (select MAX(note_id) FROM PROD_STRUCTURE_HEAD WHERE part_no = t.part_no AND eff_phase_out_date is null Group by part_no )
