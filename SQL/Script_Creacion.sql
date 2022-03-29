CREATE TABLE USUARIO(
    ID_USUARIO VARCHAR2(10),
    PASSWD VARCHAR2(10),
    CONSTRAINT USR_ID_US_PK PRIMARY KEY (ID_USUARIO),
    CONSTRAINT USR_PWD_NN NOT NULL
);


CREATE TABLE COMPRA(
    ID_COMPRA NUMBER(20),
    FECHA_COMPRA DATE,
    IMPORTE NUMBER (10,2),
    ID_USUARIO VARCHAR2(10),
    CONSTRAINT COMP_ID_COM_PK PRIMARY KEY (ID_COMPRA),
    CONSTRAINT COMP_FEC_COM_CHK CHECK (FECHA_COMPRA >= SYSDATE),
    CONSTRAINT COMP_IMP_COM_CHK CHECK (IMPORTE > 0),
    CONSTRAINT COMP_ID_US_FK FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID_USUARIO)
);


CREATE TABLE PRODUCTO(
    ID_PRODUCTO VARCHAR2(20),
    NOMBRE VARCHAR2(20),
    TIPO VARCHAR2(20),
    PRODUCTO_MEDICO BOOLEAN,
    PRECIO NUMBER (10,2),
    STOCK NUMBER (10),
    CONSTRAINT PROD_ID_PROD_PK PRIMARY KEY (ID_PRODUCTO),
    CONSTRAINT PROD_PREC_CHK CHECK (PRECIO > 0),
    CONSTRAINT PROD_STOCK_CHK CHECK (STOCK >= 0)
);


CREATE TABLE GESTION_STOCK (
    ID_USUARIO VARCHAR2(10),
    ID_PRODUCTO VARCHAR2(20),
    FECHA_GESTION DATE,
    CANTIDAD NUMBER(4),
    CONSTRAINT GST_ST_FEC_GST_NN NOT NULL,
    CONSTRAINT GST_ST_CNT_NN NOT NULL,
    CONSTRAINT GST_ST_ID_USR_FK FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID_USUARIO),
    CONSTRAINT GST_ST_ID_PRD_FK FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO (ID_PRODUCTO)  
);


CREATE TABLE CONTROLA (
    ID_COMPRA NUMBER(20),
    ID_PRODUCTO VARCHAR2(20),
    CONSTRAINT CNT_ID_COM_FK FOREIGN KEY (ID_COMPRA) REFERENCES COMPRA (ID_COMPRA),
    CONSTRAINT CNT_ID_PRD_FK FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO (ID_PRODUCTO)
);



BEGIN

    INSERT INTO USUARIO VALUES ('LUCIA', '00000001');
    INSERT INTO USUARIO VALUES ('DANIEL', '00000002');
    INSERT INTO USUARIO VALUES ('KAISCER', '00000003');
    INSERT INTO USUARIO VALUES ('IVAN', '00000004');


    INSERT INTO PRODUCTO VALUES ('NOL-001', 'NOLOTIL', 'SOBRE', TRUE, 10.00);
    INSERT INTO PRODUCTO VALUES ('NOL-002', 'NOLOTIL','PASTILAS',TRUE, 09.00);
    INSERT INTO PRODUCTO VALUES ('NOL-003', 'NOLOTIL','COMPRIMIDOS',TRUE, 09.50);

    INSERT INTO PRODUCTO VALUES ('PAR-001', 'PARACETAMOL', 'SOBRE', TRUE, 10.00);
    INSERT INTO PRODUCTO VALUES ('PAR-002', 'PARACETAMOL','PASTILAS',TRUE, 09.00);
    INSERT INTO PRODUCTO VALUES ('PAR-003', 'PARACETAMOL','COMPRIMIDOS',TRUE, 09.00);

    INSERT INTO PRODUCTO VALUES ('NAP-001', 'NAPROXENO', 'SOBRE', TRUE, 10.00);
    INSERT INTO PRODUCTO VALUES ('NAP-002', 'NAPROXENO','PASTILAS',TRUE, 09.00);
    INSERT INTO PRODUCTO VALUES ('NAP-003', 'NAPROXENO','COMPRIMIDOS',TRUE, 09.00);

    INSERT INTO PRODUCTO VALUES ('BUS-001', 'BUSCAPINA', 'SOBRE', TRUE, 10.00);
    INSERT INTO PRODUCTO  VALUES ('BUS-002', 'BUSCAPINA','PASTILAS',TRUE, 09.00);
    INSERT INTO PRODUCTO  VALUES ('BUS-003', 'BUSCAPINA','COMPRIMIDO',TRUE, 09.00);
    
    INSERT INTO PRODUCTO VALUES ('SIN-001', 'SINTROM', 'SOBRE', TRUE, 10.00);
    INSERT INTO PRODUCTO VALUES ('SIN-002', 'SINTROM','PASTILAS',TRUE, 09.00);
    INSERT INTO PRODUCTO VALUES ('SIN-003', 'SINTROM','COMPRIMIDOS',TRUE, 09.00);

    INSERT INTO PRODUCTO VALUES ('PRA-001', 'PRADAXA', 'SOBRE', TRUE, 10.00);
    INSERT INTO PRODUCTO VALUES ('PRA-002', 'PRADAXA','PASTILAS',TRUE, 09.00);
    INSERT INTO PRODUCTO VALUES ('PRA-003', 'PRADAXA','COMPRIMIDOS',TRUE, 09.00);

    INSERT INTO PRODUCTO VALUES ('GEL-001', 'GELOCATIL', 'SOBRE', TRUE, 10.00);
    INSERT INTO PRODUCTO VALUES ('GEL-002', 'GELOCATIL', 'PASTILLA', TRUE, 10.00);
    INSERT INTO PRODUCTO VALUES ('GEL-003', 'GELOCATIL', 'COMPRIMIDOS', TRUE, 10.00);
 
    INSERT INTO PRODUCTO VALUES('ACI-001','ACICLOVIR','SOBRE', TRUE, 20.00);
    INSERT INTO PRODUCTO VALUES('ACI-002','ACICLOVIR','PASTILLAS', TRUE, 15.00);
    INSERT INTO PRODUCTO VALUES('ACI-003','ACICLOVIR','COMPRIMIDOS', TRUE, 10.00);
    
    INSERT INTO PRODUCTO VALUES('VEN-001','VENTOLIN EVOHALER','INHALADOR', TRUE, 10.00);
  
    INSERT INTO PRODUCTO VALUES ('ENA-001', 'ENANTYUM', 'PASTILLAS', TRUE, 10.00);

    INSERT INTO PRODUCTO VALUES ('IBU-001', 'IBUPROFENO', 'SOBRE', TRUE, 10.00);
    INSERT INTO PRODUCTO VALUES ('IBU-002', 'IBUPROFENO', 'PASTILLAS', TRUE, 10.00);
    INSERT INTO PRODUCTO VALUES ('IBU-003', 'IBUPROFENO', 'COMPRIMIDOS', TRUE, 10.00);

    INSERT INTO PRODUCTO VALUES ('ADI-001', 'ADIRO', 'SOBRE', TRUE, 10.00);
    INSERT INTO PRODUCTO VALUES ('ADI-002', 'ADIRO', 'PASTILLAS', TRUE, 10.00);
    INSERT INTO PRODUCTO VALUES ('ADI-003', 'ADIRO', 'COMPRIMIDOS', TRUE, 10.00);


    INSERT INTO PRODUCTO VALUES ('KMN-001', 'MULETAS_KMINA', 'MULETA', FALSE, 79.00);
    INSERT INTO PRODUCTO VALUES ('FIB-001', 'GLUCOMETRO_FIBIT', 'PULSERA', FALSE, 179.00);
    INSERT INTO PRODUCTO VALUES ('ALP-001', 'ALPECIN', 'GOTAS', FALSE, 100.00);
    INSERT INTO PRODUCTO VALUES('TEN-001', 'TENSIOMETRO', 'PULSERA', FALSE, 50.00);
    


END;