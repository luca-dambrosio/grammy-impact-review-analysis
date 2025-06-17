***Marketing 2024
*STATA Session 1: EDA, tests and OLS 
global working_folder "/Users/filippodemin/Documents/DSBA/1st_YEAR/SECOND_SEMESTER/INNOVATION_MARKETING_ANALYTICS/INNOVATION_PROJECT"
**Directory setup


cd $working_folder
**Loading a dataset 
clear all
import 	delimited "all_data_FINAL_FILT_LONG_m.csv"


**Encoding
encode winner, generate(winner_numeric)
encode after, generate(after_numeric)
gen Treated = winner_numeric - 1
gen Post = after_numeric - 1



**Diff-n-diff - normal
eststo clear
reg sentiment Treated Post Treated##Post
eststo
reg rating Treated Post Treated##Post
eststo
reg num_reviews Treated Post Treated##Post
eststo
esttab using "Table1.tex", b(3) se(3) se ar2 title(Table : "Effect of Grammy win on sentiment score, user' rating and number of reviews") mtitles("Sentiment Score" "Rating" "#Reviews") nonumbers addnote("Note: Standard Errors are in parentheses ")

**Diff-n-diff - weighted
eststo clear
reg sentiment Treated Post Treated##Post [fw = num_reviews], robust
eststo
reg rating Treated Post Treated##Post [fw = num_reviews], robust
eststo

esttab using "Table2.tex", b(3) se(3) alignment(S S) se ar2 title(Table : "Effect of Grammy Win on Sentiment Score and User Rating, weighted") mtitles("Sentiment Score" "Rating") nonumbers addnote("Note: Standard Errors are in parentheses ")


**Diff-n-diff - mainstream
eststo clear
reg sentiment Treated Post Treated##Post [fw = num_reviews] if mainstream == 1, robust
eststo
reg sentiment Treated Post Treated##Post [fw = num_reviews] if mainstream == 0, robust
eststo
reg rating Treated Post Treated##Post [fw = num_reviews] if mainstream == 1, robust
eststo
reg rating Treated Post Treated##Post [fw = num_reviews] if mainstream == 0, robust
eststo
esttab using "Table3.tex", b(3) se(3) se ar2 title(Table : "Effect of Grammy Win on Sentiement Score and User Rating, by Popularity of Category") mtitles("Sentiment P" "Sentiment NP" "Rating P" "Rating NP") nonumbers addnote("Note: Standard Errors are in parentheses ")
