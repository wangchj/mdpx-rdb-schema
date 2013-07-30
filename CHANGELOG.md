## Version 8.0 (7/30/2013)

- Added tables for application user access control: Roles, UserRoles, RolePermissions.
- Change type of rfPowerSetpoint of ExperimentSetups from VCHAR(45) to type DECIMAL(18,9).
- Set unique flag on Users.email.
- Add boolean field 'isProgrammed' to table Experiments.
- Set auto-increment on SetupParts.setupPartId.

## Version 7.2 (6/12/2013)

- Parts in VesselSetups table will now be recorded in SetupParts table; therefore, the following fields are removed from VesselSetups table: chamber, upperElectrode, lowerElectrode, roughPump, turboPump, massFlowController, pressureGauge, dustShaker.
- Add isGroup (boolean) field to PartCategories table.
- Remove description field from Parts table and add to PartCategories table.

## Version 7.1 (5/23/2013)

- Make table names consistent.
  - Change table name VesselSetup to VesselSetups.
  - Change table name ExperimentSetup to ExperimentSetups.
- Remove unnecessary fields.
  - description field of VesselSetup table.
  - description field of DustTypes table.
  - name field of Parts table.

## Version 7.0 (5/23/2013)

- Merged 'connected' branch to master.
  - Remove VesselPlates table.
  - Add SetupParts table.
  - SetupParts.parent references itself.
  - Modify SetupCameras and SetupProbes table to link to the new SetupParts table.

## Version 6.0 (5/15/2013)

- Change name of diagram schema from 'mydb' to 'mdpx'.
- Add one-to-many relationship Experiments.experimentId->ExperimentSetup.experimentId.
- Add Measurements table and move Experiments.expDataPath to the new table.
- Add one-to-many relationship Experiments.experimentId->ExperimentSetup.experimentId.
- Add dateTime field to VesselSetup and ExperimentSetup.

## Version 5.4 (5/7/2013)

- Set auto-increment to VesselSetup.vesselSetupId, ExperimentSetup.setupId, and User.userId (close #3)
- Change naming of ExperimentSetup.setupId to ExperimentSetup.experimentSetupId

## Version 5.3 (4/18/2013)

- Remove relationship VesselPlates.side->ChamberSides.side 
- Added VesselSetup.chamber (Close #1)
- Created foreign keys(VesselSetup.upperElectrode->Parts.serialNum), (lowerElectrode->serialNum)
- Added foreign key (SetupProbes.probe -> Parts.serialNum)
- Removed foreign key relationship (VesselPlates.side -> ChamberSides.sideId)
