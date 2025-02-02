```cobol
01  WS-DATA-AREA.
    05  WS-ITEM-COUNT       PIC 9(5) VALUE 0.
    05  WS-ITEM-TABLE      OCCURS 100 TIMES.
       10  WS-ITEM-NUMBER   PIC 9(3).
       10  WS-ITEM-NAME    PIC X(30).
       10  WS-ITEM-PRICE   PIC 9(5)V99.

PROCEDURE DIVISION.
    PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-ITEM-COUNT
       READ ITEM-FILE AT END SET WS-EOF TO TRUE
       IF NOT WS-EOF
          MOVE ITEM-NUMBER TO WS-ITEM-NUMBER(WS-I)
          MOVE ITEM-NAME TO WS-ITEM-NAME(WS-I)
          MOVE ITEM-PRICE TO WS-ITEM-PRICE(WS-I)
          ADD 1 TO WS-ITEM-COUNT
       END-IF
    END-PERFORM
    STOP RUN.
```