-- 3. DML: Insert Records
INSERT INTO Client VALUES (
1, 'Sara Bandar', '1000000001', '0501111111',
'Oily', 'Arabic', DATE '2002-05-15');

INSERT INTO Client VALUES (
2, 'Nora Abdullah', '1000000002', '0502222222',
'Dry', 'Arabic', DATE '2001-08-20');

INSERT INTO Client VALUES (
3, 'Dana Khaled', '1000000003', '0503333333',
'Combination', 'English', DATE '2003-03-10');

INSERT INTO Client VALUES (
4, 'Rana Yasser', '1000000004', '0504444444',
'Sensitive', 'Arabic', DATE '2000-11-25');

INSERT INTO Client VALUES (
5, 'Reema Saud', '1000000005', '0505555555',
'Normal', 'English', DATE '2002-07-12');



INSERT INTO CosmeticAllergies VALUES (1, 'Fragrance');
INSERT INTO CosmeticAllergies VALUES (2, 'Parabens');
INSERT INTO CosmeticAllergies VALUES (3, 'Alcohol');
INSERT INTO CosmeticAllergies VALUES (4, 'Sulfates');
INSERT INTO CosmeticAllergies VALUES (5, 'Essential Oils');
INSERT INTO Service
(ServiceID, Category, ServiceName, Duration, Price)
VALUES (1, 'Skin Care', 'Hydrafacial', 60, 350);

INSERT INTO Service
(ServiceID, Category, ServiceName, Duration, Price)
VALUES (2, 'Skin Care', 'Deep Cleansing Facial', 45, 250);

INSERT INTO Service
(ServiceID, Category, ServiceName, Duration, Price)
VALUES (3, 'Lash Care', 'Lash Lift', 60, 200);

INSERT INTO Service
(ServiceID, Category, ServiceName, Duration, Price)
VALUES (4, 'Lash Care', 'Lash Tint', 30, 100);

INSERT INTO Service
(ServiceID, Category, ServiceName, Duration, Price)
VALUES (5, 'Skin Care', 'Moisturizing Facial', 40, 150);

INSERT INTO Receptionist
(StaffID, StaffName, HireDate, ShiftHours)
VALUES (101, 'Rana Ahmed', DATE '2026-02-27', '08:00-16:00');

INSERT INTO Receptionist
(StaffID, StaffName, HireDate, ShiftHours)
VALUES (102, 'Sama Fahd', DATE '2026-03-10', '08:00-16:00');

INSERT INTO Receptionist
(StaffID, StaffName, HireDate, ShiftHours)
VALUES (103, 'Lina Saleh', DATE '2025-02-20', '16:00-00:00');

INSERT INTO Receptionist
(StaffID, StaffName, HireDate, ShiftHours)
VALUES (104, 'Anwar Sami', DATE '2026-06-01', '16:00-00:00');

INSERT INTO Receptionist
(StaffID, StaffName, HireDate, ShiftHours)
VALUES (105, 'Noor Majed', DATE '2025-01-10', '10:00-18:00');


INSERT INTO Specialist
(StaffID, StaffName, HireDate, Specialty, Certification, YearsExperience)
VALUES (401, 'Azza Hussein', DATE '2022-05-10',
'Dermatology', 'Dermatology Certificate', 5);

INSERT INTO Specialist
(StaffID, StaffName, HireDate, Specialty, Certification, YearsExperience)
VALUES (402, 'Reham Ramadan', DATE '2021-03-15',
'Skin Care', 'Skin Care Certificate', 6);

INSERT INTO Specialist
(StaffID, StaffName, HireDate, Specialty, Certification, YearsExperience)
VALUES (403, 'Heba Khaled', DATE '2023-07-20',
'Lash Care', 'Lash Care Certificate', 3);

INSERT INTO Specialist
(StaffID, StaffName, HireDate, Specialty, Certification, YearsExperience)
VALUES (404, 'Walaa Al Berni', DATE '2020-01-12',
'Lash Care', 'Lash Care Certificate', 7);

INSERT INTO Specialist
(StaffID, StaffName, HireDate, Specialty, Certification, YearsExperience)
VALUES (405, 'Wessam Askar', DATE '2024-02-18',
'Facial Treatment', 'Facial Certificate', 2);


INSERT INTO ProvidedBy (ServiceID,SpecialistID) VALUES (1, 401);
INSERT INTO ProvidedBy (ServiceID,SpecialistID) VALUES (2, 402);
INSERT INTO ProvidedBy (ServiceID,SpecialistID) VALUES (3, 403);
INSERT INTO ProvidedBy (ServiceID,SpecialistID) VALUES (4, 404);
INSERT INTO ProvidedBy (ServiceID,SpecialistID) VALUES (5, 405);

INSERT INTO Appointment VALUES (
301, DATE '2026-10-03', '10:00', 'BK-1001',
'Skin assessment done', 'Completed',
'Al-Malqa Branch', 'Riyadh', 1, 1, 101, 401);

INSERT INTO Appointment VALUES (
302, DATE '2026-10-05', '11:30', 'BK-1002',
NULL, 'Completed',
'Al-Yasmin Branch', 'Riyadh', 2, 2, 102, 402);

INSERT INTO Appointment VALUES (
303, DATE '2026-10-08', '17:00', 'BK-1003',
NULL, 'Completed',
'Al-Malqa Branch', 'Riyadh', 3, 3, 103, 403);

INSERT INTO Appointment VALUES (
304, DATE '2026-10-12', '18:00', 'BK-1004',
NULL, 'Completed',
'Al-Yasmin Branch', 'Riyadh', 4, 4, 104, 404);

INSERT INTO Appointment VALUES (
305, DATE '2026-10-15', '13:00', 'BK-1005',
NULL, 'Completed',
'Al-Malqa Branch', 'Riyadh', 5, 5, 105, 405);

INSERT INTO Appointment VALUES (
306, DATE '2026-10-18', '10:30', 'BK-1006',
'Follow-up session completed', 'Completed',
'Al-Malqa Branch', 'Riyadh', 1, 1, 101, 401);

INSERT INTO Appointment VALUES (
307, DATE '2026-10-22', '17:30', 'BK-1007',
NULL, 'Completed',
'Al-Yasmin Branch', 'Riyadh', 2, 2, 103, 402);

INSERT INTO Appointment VALUES (
308, DATE '2026-10-25', '18:30', 'BK-1008',
NULL, 'Completed',
'Al-Yasmin Branch', 'Riyadh', 3, 4, 104, 404);

INSERT INTO Payment VALUES (601, 350, 'Card', DATE '2026-10-03', 301);
INSERT INTO Payment VALUES (602, 250, 'Cash', DATE '2026-10-05', 302);
INSERT INTO Payment VALUES (603, 200, 'Card', DATE '2026-10-08', 303);
INSERT INTO Payment VALUES (604, 100, 'Transfer', DATE '2026-10-12', 304);
INSERT INTO Payment VALUES (605, 150, 'Card', DATE '2026-10-15', 305);
INSERT INTO Payment VALUES (606, 350, 'Cash', DATE '2026-10-18', 306);
INSERT INTO Payment VALUES (607, 250, 'Card', DATE '2026-10-22', 307);
INSERT INTO Payment VALUES (608, 100, 'Transfer', DATE '2026-10-25', 308);
