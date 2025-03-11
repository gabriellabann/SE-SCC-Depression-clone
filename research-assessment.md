# Research Project Assessment

**This assessment is for the final research project only.** Use the `assessment.md` file for all mini-projects.


## Instructions

Before submitting your research project draft for grading, confirm:

1. The manuscript .qmd for your project is in the root directory and knits to .pdf without error.
2. The knitted .pdf of your draft is in the root directory, with the same filename as the .qmd.
3. This `research-assessment.md` file is in the root directory of your project repo.
4. Dr. Dowling and your section TA are collaborators on your GitHub repo with permissions to pull/push.

To complete this assessment:

1. Complete the basic information section and AI statement. 
2. Confirm all links are correct and accessible
3. Check off all objectives you are attempting to demonstrate
    1. To earn 30 points you must demonstrate each objective. However, you do not need to attempt all objectives with each draft if your goal is to build the project over time.
    2. If the objective is demonstrated somewhere other than the .qmd, add a note in the grader comments section for where to find it (e.g., "see `data-cleaning.R` lines 20-30").
4. Optionally, complete the reflection section, which may earn engagement points.


## Basic information

Name: Gabriella Bann

CNetID: gabriellabann

Section: 2

Research project title: SE-SCC-Depression

Submission date: 3/11

Submission number (1-4): 2

Project GitHub repository URL: https://github.com/gabriellabann/SE-SCC-Depression.git

Filename of manuscript .qmd: SE-SCC-Depression.qmd

Filename of knitted .pdf: SE-SCC-Depression.pdf

## AI Statement

Describe whether and how you used AI/LLMs when completing this project: 
I used ChatGPT and Deepseek to help with writing code after parsing the class presentations/notes/provided readings, especially when it came to de-bugging. Substantially used when de-bugging to get the qmd to render as a pdf.

Optionally (for engagement points) reflect on your use of AI:
I felt that I had to rely heavily on AI, googling my error messages did not always prove to be helpful, AI would usally give a quicker more comprehensive (especially Deepseek more than ChatGPT) response as to what was wrong and how to fix it. Another classmate recommended Google's AI but I did not find it as comprehensive as Deepseek.


## Overall requirements

Overall requirements for the research project are as follows:

1. The project must be a research project. It must provide background on a research topic, ask at least one research question, use data to attempt to answer that question, report the results of the data analysis, and interpret the results in the context of the research question.
2. The project must be contained in a github repository that follows git best practices and includes all necessary files to run the project from start to finish, including:
    1. The .qmd file for the manuscript
    2. All data files used in the project
    3. All scripts used in the project
    4. A README.md file & .gitignore file
3. The project must be reproducible -- a reader should be able to clone the repo and run the .qmd from start to finish without error. The .qmd file should include:
    1. A YAML header with all fields necessary for an APA manuscript
    2. Setup source chunks that load libraries, read in data, set chunk options, set seed, etc.
    3. Minimally, an IMRD structure (Introduction, Methods, Results, Discussion), though it may be more complex
    4. Integration of markdown and code chunks throughout, following best practices for using code chunks
    5. Figures and tables rendered in code chunks
    6. Inline R code & references to render data-dependent text
    7. At least 1 descriptive analysis and 1 hypothesis test, either in code chunks or sourced scripts
    8. Frequent and informative code comments throughout
4. The .qmd file should knit/render to an APA7 formatted manuscript with one click and no errors. The knitted manuscript should include:
    1. A title page with title, author, and institutional affiliation
    2. An abstract (this may be minimal, but should exist)
    3. Narrative text comprising a complete research report
    4. APA7 references, both in-text citations and a References page
    5. Publication-ready figures (2+) and tables (1+)
    6. Results of all analyses presented in-text (and where appropriate, in tables), with no raw R output; where possible, all text should be data-dependent and rendered with inline R code
    7. Quarto generated references to all figures and tables
    8. Statistical analyses and figures interpreted in narrative text
5. The .qmd should render a .pdf identical to the .pdf you submit for grading


## Assessment

The final project must demonstrate each of 30 the course learning objectives, each worth 1 point. 

Below each learning objective is a list of general expectations for meeting that objective. You should aim to meet all expectations to earn a point for meeting the objective, but these are not rigid requirements. For example, writing a complex and creative function that uses multiple arguments and returns a complex output could meet the "parse and define functions and arguments" objective, even if it is only used in one context.

Refer to the website for general tips on meeting these objectives and an FAQ.

### GitHub and R Studio

1.  Create and maintain a repo with sensible organization and naming conventions

    1.  All folder and file names are informative
    2.  Uses relative paths correctly
    3.  Does not have duplicate/redundant elements

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments: 
            - Repo should not contain any files unrelated to the project (e.g, files from the example apaquarto manuscript)
            - Top-level of repo should contain only necessary files (typically the .qmd, .bib., this assessment, the rendered pdf, README, .gitignore); other files should be organized into subdirectories
            - Your primary manuscript should be the only notebook of any kind (.qmd, .rmd. .rmarkdown)

2.  Maintain an informative and up-to-date README.md

    1.  Includes description of repo purpose, data use, research questions, etc.
    2.  Outlines the repo structure with file tree or similar

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:
            - README should minimally contain 1) description of project objective and data and 2) description of repo structure or file tress

3.  integrate a GitHub repo with an R studio project, including .gitignore file

    1.  All scripts run and all notebooks render if the repo is cloned to another location
    2.  .gitingore comprehensively excludes unnecessary, private, and very large files and are commented appropriately

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:
            - .gitignore should include (minimally) a localonly folder and pdf render files (e.g., the *_files folder, .ttt, .tex., .log, etc.), as well as comments describing the ignored items (in addition to the default ignored items if you’re using a template)

4.  effectively use version control

    1.  Used frequent, informative commit messages
    2.  Relies on document revisions rather than manually created new versions

        -   [X] Objective attempt
        -   [x] Objective met
        -   Grader comments:

### R programming

5.  Find, install, require, and load R packages

    1. No errors occur when running scripts in a new environment 
        1. If packages other than the "class packages" listed on the resources page are used, code to install/require them is included *and commented out*
        2. When a reader opts-in to installing packages by uncommenting the code, it runs without errors 
    2. Uses more than one function to install/load/require packages (including those used in commented code)

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:
            - all install/require functions should be commented out; if they run when you render the document it can cause errors. Same for the .R script -- let your user decide whether they want to install the packages.
            - Refer to the d2mr resources page for a list of the packages you can load without a commented out install line.
        
6.  Use arithmetic, comparison, and logical operators

    1. Uses all three types of operators
    2. Uses multiple operators in data transformation pipelines and/or inline R code

        -   [X] Objective attempt
        -   [x] Objective met
        -   Grader comments: in SE-SCC-Depression.R

7.  Parse and define functions and arguments

    1. Defines at least one function with at least one argument in code chunks or sourced scripts
    2. User-defined function(s) run(s) without error and produces expected output in at least 2 contexts
    3. Functions are well-documented with comments

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments: 
            - needs more documentation in comments

8.  Parse and write conditional statements and/or loops

    1. Uses conditional in multiple contexts, including dplyr pipelines
    2. Uses multiple types of conditional/loop functions (e.g., `if_else()`, `case_when()`, `for`, `while`)

        -   [X] Objective attempt
        -   [x] Objective met
        -   Grader comments: 
        

9.  Use `readr` functions to read in and write out data

    1. Reads in data from at least one source in code chunk or sourced script
    2. Writes out intermediate and/or final datasets in code chunks or sourced scripts
    3. Uses only relative paths that run without error when repo is cloned

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:
            - Does not run as written because of absolute paths

10. Use `dplyr` and `tidyr` functions to transform data

    1. Uses at least 3 unique `dplyr` functions
    2. Uses at least 1 `tidyr` function in a data transformation pipeline
    3. Combines `dplyr` and `tidyr` functions in a data transformation pipeline

        -   [X] Objective attempt
        -   [x] Objective met
        -   Grader comments: in SE-SCC-Depression.R

11. Use `stringr` functions to work with string variables

    1. Uses ate least 2 unique `stringr` functions 
    2. Uses `stringr` functions in a data transformation pipeline

        -   [X] Objective attempt
        -   [x] Objective met
        -   Grader comments: in SE-SCC-Depression.R

12. Use `forcats` functions to work with factor variables

    1. Uses ate least 2 unique `forcats` functions or one function in 2 unique contexts (with different purposes)
    2. Uses `forcats` functions in a data transformation pipeline
    - NOTE: Though they are base R functions, `factor()` and `levels()` can be used to meet this objective as long as they are used in a way that demonstrates the same skills as `forcats` functions, which should involve including optional arguments

        -   [X] Objective attempt
        -   [x] Objective met
        -   Grader comments: in addition to .qmd, in SE-SCC-Depression.R

### Data visualization with ggplot2

13. Produce 1- and 2-variable plots with `geom_*` layers

    1. Creates at least 2 figures with different `geom_*` layers (e.g., a scatter plot and a bar plot)
    2. At least one plot is multi-variable

        -   [X] Objective attempt
        -   [x] Objective met
        -   Grader comments: in addition to .qmd, in SE-SCC-Depression.R

14. Use dynamic aesthetics to group data

    1. Uses at least 2 unique data-mapped `aes()` arguments (e.g., color, shape, size) to group data in a plot in one or multiple plots

        -   [X] Objective attempt
        -   [x] Objective met
        -   Grader comments: in addition to .qmd, in SE-SCC-Depression.R
        
15. Use facets to create parallel plots

    1. EITHER:
      1. Uses both `facet_wrap()` and `facet_grid()` in two different plots *or*
      2. Uses facets with at least one plot using at least two optional arguments (e.g., modifying the number of rows and columns, using free vs fixed scales, etc.)
    2. Combines facets with other dynamic grouping aesthetics
      1. If data only includes 1 sensible grouping variable, it may be used for both the faceting and groupin aes.  

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:
            - Needs to do one of the two options listed in the first bullet point
        
16. Create publication-quality plots using `theme` and `labs` layers

    1. Plots have informative titles, axis labels, and legends
    2. Fonts are stylized professionally and legibly (e.g., adjusted size/angle/justification)
    3. Variables and labels display in plain English (e.g., "Age (years)" not "child_age_yrs"
    4. Uses at least 1 static aesthetic (e.g., color, shape, size) that improves visual clarity without mapping to data

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:
            - cannot assess because documents do not run/render

### Data analysis

17. Perform simple descriptive analyses with multiple data types

    1. Calculates summary/descriptive statistics for at least 1 numeric variable (e.g., mean, standard deviation) 
    2. Calculates summary/descriptive statistics for at least 1 non-numeric variable (e.g., frequencies, proportions)
    3. Presents results in narrative text, table, or plot
    - NOTE: This objective may be met with only numeric or non-numeric summaries if they are sufficiently complex (at Dr. Dowling's discretion)

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:
            - cannot assess because documents do not run/render


18. Perform simple hypothesis testing analyses for multiple data types

    1. Performs at least 1 hypothesis test for numeric data (e.g., t-tests, linear regression)
    2. Performs at least 1 hypothesis test for factor data (e.g., chi-square, ANOVA)
    3. Presents results in narrative text, table, or plot
    - NOTE: This objective may be met with only numeric or factor data analyses if they are sufficiently complex (at Dr. Dowling's discretion)

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:
            - cannot assess because documents do not run/render 

19. Present and interpret statistics in manuscript narrative

    1. Presents and interprets results of analyses in narrative text, like the results section of a journal article, including all information appropriate for a given analysis (e.g., effect size, p-value, confidence interval -- dependent on analysis type and results)
    2. Discriminates between statistically signficiant and non-signficant statistics, where applicable
    3. Discriminates between informative and non-informative statistics and presents only the former in narrative text
    4. Uses dynamic inline R code to render data-dependent text

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:
            - cannot assess because documents do not run/render

### BibTeX

20. Render APA7 in-text citations with BibTeX syntax for multiple citation forms

    1. Cites at least 3 sources in-text
    2. Uses at least 2 citation forms (e.g., (Author, Year), Author (Year), etc.)
    3. May use `cite_r()` to cite R and R packages

        -   [X] Objective attempt
        -   [x] Objective met
        -   Grader comments:

21. Render an APA7 references page from a .bib file

    1. Includes all sources cited in-text
    2. Formats references in APA7 style
    3. Presents accurate, complete, and error-free references
    4. May include R and R package citations with `cite_r()`
    5. May include references not cited in-text

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:
            - cannot assess because documents do not run/render

### Notebooks and code chunks

22. Create and effectively use code chunks following best practices

    1.  Uses informative names/labels
    2.  Includes frequent, informative comments
    3.  Follows the "1-chunk-1-thing" rule
    4.  Chunks are distributed throughout the manuscript, sensibly placed near the text they support

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments: 
            - .R scripts are code only, you can't include code chunks so there should not be any chunk options (e.g., label assignment)
            - chunk labels should not include spaces or special characters except hyphens
        
23. Use code chunks to set up a quarto document

    1. Sources at least 1 .R script and/or reads in necessary data
    2. Loads packages in at least 1 code chunk
    3. Sets preferences/options in at least 1 code chunk
    4. Organizes setup chunks sensibly

        -   [X] Objective attempt
        -   [x] Objective met
        -   Grader comments:
        
24. Render publication-quality tables, figures, and images from code chunks

    1. Produces at least 1 table or image with a caption
    2. Produces at least 1 figure/plot with a markdown caption (title) and note
    3. Captions are informative, complete, and render correctly
    4. All tables and figures are referenced in the narrative text (e.g., Figure 1)
    5. References render without error and link to the correct table/figure in pdf/html output
    - NOTE: Ideally your table(s) should be produced in APA7 style, but this is not a strict requirement. At a minimum, they should render as formatted tables (not raw output), have readable and correctly formatted text (e.g., column headers should be capitalized and in plain english, not literal variable names), and the table must be dynamically referenced in the text.

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:
            - cannot assess because documents do not run/render

25. Execute descriptive and inferential analyses in code chunks

    1. At least 1 code chunk executes a descriptive analysis (e.g., `summary()`, `table()`)
    2. At least 1 code chunk executes a hypothesis test (e.g., `t.test()`, `chisq.test()`)
    3. Results are presented in narrative text, table, or plot
    4. Results are not displayed as raw R output
    5. Chunks are organized sensibly and appear near the text they support

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:
            - cannot assess because documents do not run/render

### R Markdown and Quarto

26. Create and maintain a quarto document YAML header
    
    1. Includes all necessary metadata, output options, and formatting options necessary to render an APA styled document (or other specified style if appropriate for the project)

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments: 
            - cannot assess because documents do not run/render
        
27. Use quarto R Markdown to compose an academic manuscript

    1. Uses at least 2 unique text styles (e.g., bold, italics, code)
    2. Uses at least 2 unique header levels
    3. Includes at least 1 list
    4. Includes at least 1 footnote
    - NOTE: This is going to be one of the most flexible objectives to demonstrate.  You need to demonstrate a range of markdown skills and use them to make a readable, informative manuscript. Hitting the four points above should do that, but you can use your judgment about what kind of markdown features will best serve your project. No matter what, you should use markdown to follow APA7 guidelines.

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments: 
            - cannot assess because documents do not run/render

28. Use inline R variables to replace static text

    1. Replaces static text with inline R references in at least 3 unique numeric contexts
    2. Replaces static text with inline R references in at least 1 character context
    3. Ideally, uses inline R references for *all* data-dependent text

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments: 
            - cannot assess because documents do not run/render

29. Run inline R functions to render dynamic data-dependent text

    1. Uses inline R functions to render at least 3 unique data-dependent text outputs (e.g., performs rounding, calculates means, subtracts one list length from another, etc. -- inline rather than in a code chunk)

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:
            - cannot assess because documents do not run/render
        
30. Use `knitr` and quarto to produce an APA7 formatted 1-click PDF manuscript

    1. Produces a PDF output that is formatted in APA7 style
    2. PDF includes all necessary elements (e.g., title page, abstract, body, references)
    3. PDF renders without error and includes all text, tables, and figures
    4. No additional steps are needed (e.g., finding data, determining necessary packages to install and load, running unsourced scripts, correcting aboslute paths)

        -   [X] Objective attempt - new attempt
        -   [ ] Objective met
        -   Grader comments:    
            - cannot assess because documents do not run/render
            - We'll figure it out!! 
   

## Reflection (Optional)

Optionally (for engagement points) write a brief reflection about your work on this project. You can use this space to answer the following questions, but feel free to ignore these questions and write about whatever you think is most important.

- What was the most challenging aspect of this project?
- What was the most rewarding aspect of this project?
- What would you do differently if you were to start over?
- What did you learn from this project that you will carry forward to future projects?
- What are you most proud of in this project?


Alternatively/additionally in mind some of the suggested ways to earn engagement points, and expand on this (or other aspects of your project) in your reflection:

- Creating many figures and tables, or particularly complex or creative ones
- Impressively thoughtful and thorough narrative writing in your literature review or discussion section
- Employing sophisticated statistical techniques in your analysis
- Making excellent use of markdown features to create a polished final product
- Having a maximally reproducible and dynamic manuscript
- Fully committing to best practices for version control and GitHub integration/organization

The most challenging aspect of this porject was most definetly the debugging, I also needed heavy assistance in writing the code itself but that in itself wasn't so difficult. The debugging took by far the most time and was the
most nerve-racking. The most rewarding aspect of this project would probably be the finished project, however I ran into so many bugs that I was unable to render the pdf properly, and am completely lost as to how to achieve this.
I've already exhausted every resource I can imagine and am on the brink of defeat. If I were to start over, I would definitely have attempted this project earlier in the quarter as to recieve more ongoing feedback. My biggest
regret in this course is letting things slide till the second half of the quarter. From this project, I learned many coding skills like data cleaning, wrangling, visualization, and especially how to use Quarto to create 
manuscripts. This latter skill was most emphasized since the others I had used in prior mini-projects but not this one. What I am most proud of in this project is the scripts I have written to code/score different psychological
measures. These will be very useful for other work given to me by the lab I am in.

Creating figures and tables was complicated, the code itself wasn't so bad since the data visualization went fairly well in the mini project, however in this final project I ran into significant issues with scoring the CES-D. For 
some reason it kept giving me errors or telling me all participant's values were 0 when I know for a fact by looking at the raw data it is not. I'm at the point where I might comment out this coding to show I did the work and 
manually code the responses in excel so that the scoring and onward may run more smoothly. Weirdly enough too even though the IAT and Rosenberg Self-Esteem Scale went perfectly the first time around I ran the functions, every time 
I've tried to since it keeps giving me errors which doesn't make sense. To be completely honest due to courseload among other extracurricular responsibilities I did not have sufficient time to write any new content for the narrative of my literature review or discussion section, all that is included is copy paste from my thesis proposal. The statistical analysis techniques were ~somewhat~ fun to use, definetely important, however due to the many 
issues I experienced I may go back to just using SPSS for further thesis work since that is what my lab uses in the first place. To be completely honest I'm not sure what else I could use in terms of markdown features to create 
more of a polished final product. Once the bugs are worked out, if they even can be, this manuscript will be beneficial if reproducible and dynamic since the data I'm using is coming from cohort one of wave one of an ongoing 
study. Feeding in the data from cohort one wave 2 and 3, and the next/final cohort would be greatly beneficial to saving time in data analysis. One thing I do feel I have the hang of it fully comitting to best practices for 
version control and GitHub integration/organization. In general I feel I'm a highly organized person, so I greatly appreciate the level of version control given by GitHub, being someone who often goes back into GoogleDocs history or keeps a running extra document with changes/deletions.

NEW REFLECTION:

The pdf still issues to render, the .qmd from the cloned repo did not render either, and uninstalling and reinstalling APA quarto did not work either, and I do not have the brain space to start a new repo one day before the deadline. Since it does render to .docx I hope you can assess the majority of objectives from there, but I understand if the final objective #30 is shot. Thank you again for your help in office hours and your helpful comments in this assessment file. Rendering to pdf was definetely the hardest part of this assessment by far. I wish I could write a longer reflection but frankly I'm exhausted after trying to resolve this for 8 some hours straight. Take care.

## Grading

All final projects are graded by Dr. Dowling. You will see your grade on Canvas separated into two categories: objective points and engagement points.

-   **Objective points:** 10/30
-   **Engagement points:** 5/10
-   **Total points:** 15/40

**Comments:**

Submission 1:

This .qmd does not render for several reasons, including:

    1. csl does not exist
    2. code in t-test chunk does not run without error
    
I can disable the t-test chunk, but the csl is a major problem that you'll need to repair for me to render. As a result, I can't give you points for anything that relies on the .pdf rendering, though for some things I can see that they are probably going to meet the objective once you work out the rendering problems. 

Remember that this needs to render with apaquarto, which has special requirements. For example, it should not use a csl file at all and the output format should be `apaquarto-pdf`.

I know you're having trouble with apaquarto, but we'll figure it out! We can work on it in class on Friday, and you can make an office hours appointment with me during my extra hours this week and next if that would be helpful!
