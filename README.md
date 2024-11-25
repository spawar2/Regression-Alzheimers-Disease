[R: MASS, car, glm.predict].
Yale University, School of Medicine, Department of Genetics, Yale Center for Genome Analysis (YCGA), Connecticut,  New Haven, United States of America (USA).
https://campuspress.yale.edu/shrikantpawar/

Regression-Alzheimers-Disease.R: Read variables Subject (PTID) Participant ID
RID Participant roster ID
Image.Data.ID MRI ID
Modality Image type
Visit 1=screening scan
Acq.Date MRI date
DX.bl Diagnosis at baseline
EXAMDATE Examination Date
AGE Age at baseline
PTGENDER Sex
PTEDUCAT Years of Education
PTETHCAT Ethnicity
PTRACCAT Race
APOE4	APOE4 genotype
MMSE	MMSE score for Alzheimers Disease, FIT ORDINAL REGRESSION, perform predictions.
selected function(factor, glm.predict, ordinal.fit).

Testing: table(testing$V2,pred_test) Prediction_test alive dead alive 214 5 dead 31 11 ((214+11)/(nrow(testing)))*100 [1] 86.2069.
