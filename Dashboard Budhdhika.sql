select x.cf$_part_no part_no,u.description,x.cf$_qty required_qty,y.LOADED_QTY,Z.ST3FGA,T1."A,C1",T0.C2,t.CURING 
from IFSAPP.S_H_I_P_Q_T_Y_S_T3_CLV x

left join
(Select a.PART_NO,COUNT(a.SERIAL_NO) LOADED_QTY from IFSAPP.INVENTORY_TRANSACTION_HIST2 a
where a.DATE_CREATED LIKE SYSDATE and DATE_TIME_CREATED between to_date( to_char( DATE_TIME_CREATED, 'YYYYMMDD') || '8:0:0', 'YYYYMMDDHH24:MI:SS') and to_date( to_char( DATE_TIME_CREATED, 'YYYYMMDD') || '23:0:0', 'YYYYMMDDHH24:MI:SS')
and a.TRANSACTION_CODE = 'INVM-IN' AND a.LOCATION_NO IN ('ST3-LN-3956','ST3-LO-1992','ST3-HL-0001','ST3-HL-0001-FG','ST3-HL-0001-QA','ST3-LN-3936-FG',
'ST3-LN-3936-QA','ST3-LO-1992-FG','ST3-LO-1992-QA','ST3-LN-3956-FG','ST3-LN-3956-QA','ST3-LX-1297-FG','ST3-LX-4024-FG','ST3-LX-4025-FG') --AND a.USERID='PRRALK'
GROUP BY a.PART_NO)y on x.cf$_part_no=y.part_no

Left join
(select a.PART_NO,COUNT(a.serial_no) ST3FGA from IFSAPP.INVENTORY_PART_IN_STOCK_CFV a where LOCATION_NO = 'ST3-FG-A' and QTY_ONHAND <> 0  GROUP BY a.PART_NO)z on x.cf$_part_no=z.part_no

Left join

(select part_no,count(a.serial_no) curing from IFSAPP.C_TIRE_MANUF_PROC_OVW a where to_char(a.CURE_DATE,'YYMM')=to_char(sysdate,'YYMM') and a.GRADE is null and a.GT_LOT_NO is not null and (IFSAPP.Shop_Ord_API.Get_Mtrl_State(ORDER_NO,RELEASE_NO,SEQUENCE_NO) like 'Com%') group by a.part_no)t on x.cf$_part_no=t.part_no

inner join IFSAPP.PART_CATALOG u on x.cf$_part_no=u.PART_NO
Left Join 
(select t.PART_NO,Count(t.SERIAL_NO) C2
from IFSAPP.INVENTORY_PART_IN_STOCK_CFV t where t.CF$_C_TIRE_GRADE = 'C2' and t.QTY_ONHAND > 0
and t.LOCATION_NO IN ('ST3-FG-A') 
Group by t.PART_NO)T0 ON x.CF$_PART_NO = T0.Part_no

Left Join
(select t.PART_NO,Count(t.SERIAL_NO) "A,C1"
from IFSAPP.INVENTORY_PART_IN_STOCK_CFV t where t.CF$_C_TIRE_GRADE in ('C1','A') and t.QTY_ONHAND > 0
and t.LOCATION_NO IN ('ST3-FG-A') 
Group by t.PART_NO) T1 on x.CF$_PART_NO = T1.Part_no
