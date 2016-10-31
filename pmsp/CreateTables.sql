--CREATE SCHEMA ntt;

SET SCHEMA NTT;

DROP TABLE WorkOrder CASCADE;
DROP TABLE NotificationHeader CASCADE;
DROP TABLE NotificationItem CASCADE;
DROP TABLE NotificationAttachment CASCADE;

CREATE COLUMN TABLE WorkOrder ( 
    AUFNR VARCHAR(12), 
    AUART VARCHAR(4),
    AUTYP VARCHAR(2), 
    WERKS VARCHAR(4),
    LOEKZ VARCHAR(1),
    IPHAS VARCHAR(1),
    TECHNICIAN VARCHAR(12),
    ERNAM VARCHAR(12),
    ERDAT DATE,
    AENAM VARCHAR(12),
    AEDAT DATE,
    QMNUM VARCHAR(12), 
    PRIMARY KEY (AUFNR)
  ); 

CREATE COLUMN TABLE NotificationHeader (
    QMNUM VARCHAR(12),
    QMART VARCHAR(2),
    QMTXT VARCHAR(40),
    PRIOK VARCHAR(1),
    MZEIT TIME,
    QMDAT DATE,
    QMNAM VARCHAR(12),
    AUFNR VARCHAR(12),
    WERKS VARCHAR(4),
    MATNR VARCHAR(18),
    KUNUM VARCHAR(10),
    ERNAM VARCHAR(12),
    ERDAT DATE,
    AENAM VARCHAR(12),
    AEDAT DATE,
    PRIMARY KEY (QMNUM) 
  ); 
  
CREATE COLUMN TABLE NotificationItem (
    QMNUM VARCHAR(12),
    FENUM VARCHAR(4),
    FEGRP VARCHAR(8),
    FECOD VARCHAR(4),
    FETXT VARCHAR(40),
    FETXT_LONG VARCHAR(1000),
    ERNAM VARCHAR(12),
    ERDAT DATE,
    AENAM VARCHAR(12),
    AEDAT DATE,
    PRIMARY KEY (QMNUM,FENUM) 
  );


CREATE COLUMN TABLE NotificationAttachment (
    QMNUM VARCHAR(12),
    FENUM VARCHAR(4),
    FILENAME VARCHAR(40),
    FILETYPE VARCHAR(10),
    DATA_CONTENT BLOB,
    PRIMARY KEY (QMNUM,FENUM) 
  );
  
alter table NotificationAttachment add foreign key (QMNUM) references NotificationHeader (QMNUM) on delete set null;
alter table NotificationItem add foreign key (QMNUM) references NotificationHeader (QMNUM) on delete set null;
alter table WorkOrder        add foreign key (QMNUM) references NotificationHeader (QMNUM) on delete set null;
