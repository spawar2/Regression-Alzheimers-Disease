#Ordinal Regression Alzheimers Disease, Shrikant Pawar

#Variable Descriptions
Subject (PTID) Participant ID
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
MMSE	MMSE score

#Read and view data
dat = read.csv()

#Labels: AD (Alzheimer's), LMCI (Limited Mild Cognitive Impairment), CN (Cognitively Normal)

Y = dat$DX.bl
summary(Y)

#make sure Y is ordinal
Y = factor(Y, levels=c('CN', 'LMCI', 'AD'), ordered=TRUE)

y_test = factor(y_test, levels=c('CN', 'LMCI', 'AD'), ordered=TRUE)

head(Y)

#Train-test split: 75% train (471), 25% test (157)

num_test = num_rows/4

num_train = num_rows - num_test



#Pick variables 10:18 for training data

train = dat[1:num_train, 10:18]

test = dat[(num_train+1):num_rows, 10:18]

y_train = Y[1:num_train]

y_test = Y[(num_train+1):num_rows]

## FIT ORDINAL REGRESSION 

library(MASS)

library(car)

library(glm.predict)

ordinal.fit = polr(y_train ~ .-PTETHCAT -APOE.Genotype, data=train, Hess=TRUE)

summary(ordinal.fit) #AIC = 583



test = data.frame(test)

predictions = predict(ordinal.fit, newdata=test)

predictions = factor(predictions, levels=c('CN', 'LMCI', 'AD'), ordered=TRUE)

#calculate accuracy of predictions

stopifnot(length(predictions) == length(y_test))

accuracy_vector = (predictions == y_test)

head(accuracy_vector)



num_correct = table(accuracy_vector)[2]

accuracy = num_correct / num_test 

