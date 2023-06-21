CREATE DATABASE clinic;

CREATE TABLE patients (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_bith DATE
);

CREATE TABLE medical_histories (
    id INT PRIMARY KEY,
    admitted_at timestamp,
    status VARCHAR(300),
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE treatments (
    id INT PRIMARY KEY,
    type VARCHAR(100),
    name VARCHAR(100)
);

CREATE TABLE invoices (
    id INT PRIMARY KEY,
    total_amount DECIMAL,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id INT PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE INDEX medical_histories_patient_index ON medical_histories(patient_id);
CREATE INDEX invoice_items_index ON invoice_items(invoice_id);
CREATE INDEX invoice_items_treatment_id_index ON invoice_items(treatment_id);
CREATE INDEX med_histories_treatments_index ON med_histories_treatments(med_history_id);
CREATE INDEX med_histories_treatments_treatment_id_index ON med_histories_treatments(treatment_id);
CREATE INDEX invoices_medical_history_id_index ON invoices(medical_history_id);

