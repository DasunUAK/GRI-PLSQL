DECLARE
  CURSOR get_details IS
     SELECT *
     FROM IC_SALES_PART_CUST_UPLOAD_TAB;
     
  /*CURSOR get_rowdata(contract_ IN VARCHAR2, part_no_ IN VARCHAR2) IS
     SELECT t.part_no
     FROM INVENTORY_PART_PLANNING_TAB t
     WHERE  t.contract = contract_
     AND t.part_no = part_no_;
     
  CURSOR get_rowkey IS
     SELECT t.rowkey
     FROM SALES_PART_tab t, IC_SALES_PART_CUST_UPLOAD_TAB p
     WHERE  t.contract = p.contract
     AND t.part_no = p.part_no
     AND NOT t.rowkey IN (SELECT s.rowkey FROM SALES_PART_CFT s);
     
  rowkey_   VARCHAR2(50);*/
        
BEGIN
  /* FOR rec_ IN get_rowkey LOOP
          INSERT INTO SALES_PART_CFT (rowkey)
       VALUES (rec_.rowkey);
 
 END LOOP;*/
 
 FOR rec_ IN get_details LOOP
   UPDATE INVENTORY_PART_PLANNING_TAB v
   SET v.min_order_qty = rec_.MIN_ORDER_QTY, v.order_requisition = rec_.ORDER_REQUISITION_DB
   WHERE v.part_no = rec_.part_no;
 
 END LOOP;

END;

