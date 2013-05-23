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
