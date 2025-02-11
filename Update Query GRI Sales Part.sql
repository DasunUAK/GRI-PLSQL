DECLARE
  CURSOR get_details IS
     SELECT *
     FROM IC_SALES_PART_CUST_UPLOAD_TAB;
     
  CURSOR get_rowdata(contract_ IN VARCHAR2, part_no_ IN VARCHAR2) IS
     SELECT t.rowkey
     FROM SALES_PART_tab t
     WHERE  t.contract = contract_
     AND t.part_no = part_no_;
     
  CURSOR get_rowkey IS
     SELECT t.rowkey
     FROM SALES_PART_tab t, IC_SALES_PART_CUST_UPLOAD_TAB p
     WHERE  t.contract = p.contract
     AND t.part_no = p.part_no
     AND NOT t.rowkey IN (SELECT s.rowkey FROM SALES_PART_CFT s);
     
  rowkey_   VARCHAR2(50);
        
BEGIN
   FOR rec_ IN get_rowkey LOOP
          INSERT INTO SALES_PART_CFT (rowkey)
       VALUES (rec_.rowkey);
 
 END LOOP;
 
 FOR rec_ IN get_details LOOP
   OPEN get_rowdata(rec_.contract,rec_.part_no);
   FETCH get_rowdata INTO rowkey_;
   CLOSE get_rowdata;
   
   UPDATE SALES_PART_CFT v
   SET v.cf$_segment = rec_.Segment
   WHERE v.rowkey = rowkey_;
 
 END LOOP;

END;

