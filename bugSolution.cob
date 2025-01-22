```cobol
01  WS-DATA-AREA.
    05  WS-ITEM-COUNT       PIC 9(5) VALUE 0.
    05  WS-ITEM-TABLE      OCCURS 100 TIMES.
       10  WS-ITEM-NUMBER   PIC 9(3).
       10  WS-ITEM-NAME    PIC X(30).
       10  WS-ITEM-PRICE   PIC 9(5)V99.
    05  WS-I               PIC 9(3) VALUE 1.  

PROCEDURE DIVISION.
    PERFORM UNTIL WS-EOF
       READ ITEM-FILE AT END SET WS-EOF TO TRUE
       IF NOT WS-EOF
          IF WS-I <= 100 
             MOVE ITEM-NUMBER TO WS-ITEM-NUMBER(WS-I)
             MOVE ITEM-NAME TO WS-ITEM-NAME(WS-I)
             MOVE ITEM-PRICE TO WS-ITEM-PRICE(WS-I)
             ADD 1 TO WS-I
             ADD 1 TO WS-ITEM-COUNT
          ELSE
             DISPLAY "Table Full, cannot add more items."
          END-IF
       END-IF
    END-PERFORM
    STOP RUN.
```