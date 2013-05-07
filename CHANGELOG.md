## Version 5.4 (5/7/2013)

- Set auto-increment to VesselSetup.vesselSetupId, ExperimentSetup.setupId, and User.userId (close #3)
- Change naming of ExperimentSetup.setupId to ExperimentSetup.experimentSetupId

## Version 5.3 (4/18/2013)

- Remove relationship VesselPlates.side->ChamberSides.side 
- Added VesselSetup.chamber (Close #1)
- Created foreign keys(VesselSetup.upperElectrode->Parts.serialNum), (lowerElectrode->serialNum)
- Added foreign key (SetupProbes.probe -> Parts.serialNum)
- Removed foreign key relationship (VesselPlates.side -> ChamberSides.sideId)
