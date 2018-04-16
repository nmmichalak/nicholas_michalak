* read data.
GET DATA  /TYPE=TXT
  /FILE="/Users/nicholasmichalak/Nicholas_michalak/blog_entries/2018/nrg05/lC14T8.csv"
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=","
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  subj F2.0
  Group F1.0
  age F4.1
  angle A6
  rt F3.0
  angle_num F1.0
  angle_lin F2.0
  angle_quad F2.0.
DATASET NAME lC14T8 WINDOW=FRONT.

* treat subjects as nominal.
VARIABLE LEVEL subj (NOMINAL).

* fit model with unstructured covariance and linear slopes for angle.
MIXED rt WITH angle_lin angle_quad angle_num age
   /FIXED = angle_lin angle_quad age angle_lin * age angle_quad * age
   /PRINT = SOLUTION TESTCOV
   /RANDOM = INTERCEPT angle_num | SUBJECT(subj) COVTYPE(UN).
