-- 4. SQL Queries

-- Query 1: SELECT with JOIN
-- Scenario: The clinic manager requested a report showing each client's
-- name and cosmetic allergies to help staff identify potential allergic
-- reactions and provide safer cosmetic treatments.

SELECT Client.Name, CosmeticAllergies.CosmeticAllergies
FROM Client
JOIN CosmeticAllergies
ON Client.ClientID = CosmeticAllergies.ClientID;


-- Query 2: UPDATE with WHERE
-- Scenario: The clinic receptionist requested an update to client
-- Nora Abdullah's skin type from Dry to Combination to keep her
-- information accurate for future treatments.

UPDATE Client
SET SkinType = 'Combination'
WHERE ClientID = 2;


-- Check the Updated Record
-- Scenario: The clinic receptionist requested to view Nora Abdullah's
-- updated record to confirm that her skin type was successfully
-- changed to Combination.

SELECT ClientID, Name, SkinType
FROM Client
WHERE ClientID = 2;


-- Query 3: GROUP BY with AVG
-- Scenario: The clinic manager requested the average service
-- price for each category to review pricing.

SELECT Category, AVG(Price) AS Avg_Price
FROM Service
GROUP BY Category;


-- Query 4: GROUP BY with HAVING
-- Scenario: The reception supervisor requested the shifts
-- with more than one receptionist to review staff coverage.

SELECT ShiftHours, COUNT(StaffID) AS Receptionist_Count
FROM Receptionist
GROUP BY ShiftHours
HAVING COUNT(StaffID) > 1;


-- Query 5: UNION
-- Scenario: The clinic manager requested a list of all specialists
-- and receptionists to review the staff members working at DORA Clinic.

SELECT StaffID, StaffName
FROM Specialist

UNION

SELECT StaffID, StaffName
FROM Receptionist;


-- Query 6: SELECT with Nested Query
-- Scenario: The clinic manager requested a report of appointments booked for services
-- priced above the average service price, to identify which branches and dates have
-- demand for premium services and plan specialist assignments.

SELECT AppointmentID, AppointmentDate, Status, BranchName
FROM Appointment
WHERE ServiceID IN (
  SELECT ServiceID
  FROM Service
  WHERE Price > (SELECT AVG(Price) FROM Service)
);


-- Query 7: SELECT with WHERE
-- Scenario: The clinic manager requested a report showing all payments
-- with amounts greater than 300 to monitor high-value transactions
-- and review the clinic's revenue.

SELECT PaymentID, Amount, PaymentMethod, PaymentDate
FROM Payment
WHERE Amount > 300;


-- Query 8: DELETE with WHERE
-- Scenario: The clinic accountant requested the deletion of payment
-- record 604 made through Transfer to remove an unwanted payment
-- record and keep the clinic's payment records accurate.

DELETE FROM Payment
WHERE PaymentID = 604
AND PaymentMethod = 'Transfer';


-- Save Changes
COMMIT;


