INSERT INTO Document (
LegacyDocumentId,
PatientId,
ProviderId,
VisitDate,
EditDate,
Proofed,
Billed,
SecurityLevel,
Notes) 
VALUES (
@LegacyDocumentId,
@PatientId,
@ProviderId,
@VisitDate,
@EditDate,
@Proofed,
@Billed,
@SecurityLevel,
@Notes
);