
# Helsinki Social Statistics
<a href=https://www.datacamp.com/teach/repositories/65844921/go target="_blank"><img src="https://s3.amazonaws.com/assets.datacamp.com/img/github/content-engineering-repos/course_button.png" width="150"></a>
<a href=https://www.datacamp.com/teach/repositories target="_blank"><img src="https://s3.amazonaws.com/assets.datacamp.com/img/github/content-engineering-repos/dashboard_button.png" width="150"></a>

Wellcome to the Helsinki Social Statistics DataCamp course repository. Changes made to this GitHub repository are automatically reflected in the linked DataCamp course. Click on the link above to go to the course page.

# About  

This DataCamp course works as the data science module for the Social Statistics MOOC at the University of Helsinki, Finland. The course is lectured and superwised by adj.prof. Kimmo vehkalahti. The module is created by Tuomo Nieminen and Emma Kämäräinen.

# Course curriculum 

Below is a summary of the DataCamp exercises.

## Chapter 1: R and Statistics  
Basics of R, the amazing statistical programming language. Do not be afraid of the art of programming!

- What is R?
- Basic tools
- Arithemtics
- Objects
- Functions
- Good arguments
- students2014

## Chapter 2: Data types and variable types  
Quick overview to R data and variable types. What are the objects? You are the subject.

- Data frames
- Data types (1)
- Data types (2)
- Vectors
- Data types and measurement scales

## Chapter 3: Looking at the data  
Data are everywhere and everything. That's why Statistics is also called Data Science. R offers great tools for looking at the data, behind the numbers.

- Getting intimate with the data
- Summary() statistics
- Bar plots of qualitative variables
- Bar plots of continuous variables
- Histograms
- Box plots

## Chapter 4: Exploring variations and dependence  
Variation and dependence are at the heart of Statistics. In fact, without variation the discipline would cease to exist. Correlation is not causation, but why?

- Be aware of varying variables
- Help()!
- Standard deviation
- Clustering
- Guess the correlation

## Chapter 5: Working across the data  
Cross-tabulations let you explore dependencies hidden deep within discrete variables.

- Combining variables
- Tables
- Metadata of students2014
- Cross tabulations
- Let's (bar)plot that table
- And then little more plotting

## Chapter 6: Subsets and conditions  
Let's begin to seek the best conditions for coping with uncertainty.

- Welcome to part 2!
- Explore youre data
- Selecting a subset
- Logical comparison
- Logical operators
- Classical probability
- COnditional probability

## Chapter 7: Probability distributions  
Most things in this world are more or less random, and not evenly distributed.

- Random variables and probability distributions
- Binomial distribution
- Normal distribution (1)
- Normal distribution (2)
- Uniform distribution
- Quantiles
- Two-way quantiles
- Standardization

## Chapter 8: Estimation  
Get your brackets ready for diving in the world of statistical inference!  

- Exploring estimation with R
- Indices and brackets
- Easy vectors
- Looping
- Point estimation
- Interval estimation
- The sampling distributions
- The central limit theorem

## Chapter 9: Hypothesis testing  
We all might be statistically different, but maybe we are part of the 68%.  

- Statistical hypothesis testing
- Test statistics
- Pecualiar p-values
- Alternative hypothesis: which way to go?!
- Meet the tests (1)
- Meet the tests (2)
- Create your own functions

## Chapter 10: Regression  
Now, pick roles for the variables and start modeling. I predict you are good!

- Packages in R
- Exploring the relationship of two variables
- What is a linear model?
- Fitting a linear model
- Interpreting a fitted model
- Checking the validity of model assumptions
- Making predictions based on the model 

# DataCamp course creation

Changes you make to this GitHub repository are automatically reflected in the linked DataCamp course. This means that you can enjoy all the advantages of version control, collaboration, issue handling ... of GitHub.

## Workflow

1. Edit the markdown and yml files in this repository. You can use GitHub's online editor or use <a href=https://git-scm.com/ target="_blank">git</a> locally and push your changes.
2. Check out your build attempts on the <a href=https://www.datacamp.com//teach/repositories target="_blank">Teach Dashboard</a>.
3. Check out your automatically updated <a href=https://www.datacamp.com/teach/repositories/65844921/go target="_blank">course on DataCamp</a>

## Getting Started

A DataCamp course consists of two types of files:

- `course.yml`, a <a href=http://docs.ansible.com/ansible/YAMLSyntax.html target="_blank">YAML-formatted file</a> that's prepopulated with some general course information.
- `chapterX.md`, a markdown file with:
   - a YAML header containing chapter information.
   - markdown chunks representing DataCamp Exercises.

To learn more about the structure of a DataCamp course, check out the <a href=https://www.datacamp.com//teach/documentation#tab_course_structure target="_blank">documentation</a>.

Every DataCamp exercise consists of different parts, read up about them <a href=https://www.datacamp.com//teach/documentation#tab_code_exercises target="_blank">here</a>. A very important part about DataCamp exercises is to provide automated personalized feedback to students. In R, these so-called Submission Correctness Tests (SCTs) are written with the <a href=https://github.com/datacamp/testwhat target="_blank">`testwhat`</a> package. Check out the GitHub repositories' wiki pages for more information and examples.

You can also use the exercise_template.Rmd to get started on creating exercises for this Helsinki Social Statistics course.

Want to learn more? Check out the <a href=https://www.datacamp.com//teach/documentation target="_blank">documentation</a> on teaching at DataCamp.

*Happy teaching!*
