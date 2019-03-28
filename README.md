# Project Proposal  

## Problem Statement  
The goal of this project is to identify predictors of behaviors that increase the risk of HIV acquisition and/or transmission among male sex workers in Rhode Island. A previous study was conducted on this topic and with this population, but the data used for that study were collected in 2010 and its sample population was considerably smaller than what is available for this project. With more current data and a larger sample population, it is our intent to confirm what has previously been reported, and to provide information that can be used by local community-based organizations to develop and implement effective risk-reduction strategies. Specifically, we plan to share our results with Weber-Renew, a local nonprofit that provides harm-reduction services to male, female and transgender sex workers in RI.  

## Background  
Internationally, male sex workers have been shown to HIV prevalence rates of up to 50%. Although HIV prevalence estimates among this population are not this high in the United States, they are still significantly higher when compared to other high-risk groups such as men having sex with men (7.3% vs 1.1%). These high rates can be attributed to the fact that many of these men report engaging in unprotected sex with male clientele as well as sharing needles with others when injecting drugs – behaviors that have both been shown to significantly increase risk of HIV acquisition. Despite being at higher risk of HIV acquisition, male sex workers will often forego preventative care and treatment services because of substantial social stigma.
It is important to note that many of these men and their predominantly male clientele identify as heterosexual or bisexual – many have wives, girlfriends or other female partners with whom they frequently engage in unprotected sex2,5. As such, this group, directly or indirectly, can act as a vector of HIV transmission to several different populations2-5. For these reasons, identifying factors that increase risky behaviors among male sex workers is an important step in reducing the incidence of HIV. With this information, interventions can be developed to address the underlying causes of risky behaviors.
In 2008, a RI-based agency called Project Weber (now Weber-Renew) was created by two former male sex workers who saw a need to increase access to harm-reduction services to this high-risk population. The organization initially started with a small team of volunteers conducting street-based outreach, but in 2013, it received state funding to open up a drop-in center. Run by peer educators, the drop-in center provides male sex workers a safe space where they could receive harm-reduction services such as risk-reduction counseling, sexually transmitted infection (STI) testing and needle exchange.  

## Data Description  
The data used for this analysis were collected as part of a survey completed by clients of Project Weber. All surveys were conducted by trained peer-educators at Project Weber’s drop-in center from February to December of 2014. Before analysis was conducted, the data were stripped of any identifiable information by the organization. See Appendix 1 for Client Survey. The variables included in this analysis were the following:  
* Age
* Education Level
* Housing Stability in the Last 6 Months
* Was client ever incarcerated?
* Recent Access to Healthcare Services
* Recent Domestic Abuse
* Number of Years Working as Escort
* Drug Use in the Last 6 Months
* Number of Female Partners
* Number of Male Partners

## Data Preprocessing  
The survey consists of 44 questions and the information was collected by trained professionals. Some the of 44 questions ask for similar information such as health care usage or current/past living situation. This produces features which are highly collinear with other variables within the dataset. Additionally, there were only 140 surveys completed. Given the sample size and the occurrence of highly collinear features, it was decided that a limit of about 12 features should be used for the learning process. This number was chosen by taking the square root of the sample size. It is a general rule of thumb when working with highly correlated data. Out of the 140 samples, 23 had to be dropped due to missing values. This leaves a dataset of 117 samples. Following the previous rule of thumb, there should be an upper limit of about 11 features on the reduced dataset. This feature limit is not a strict one. The number of features can be increased if deemed necessary. The features used in the analysis have been described in the data description section. Of these features some were chosen out of a group of other similar questions. For instance, question 8 asked the client whether or not they has access to stable housing within the past six months. There were 3 other questions which also asked about housing, but question 8 seemed to be the most prevalent housing question to use for this analysis. Similar decisions were made about every other question chosen as a feature for the analysis. Given that the data was collected by trained professionals, the main factor affecting the dataset was missing values. After removing the samples which had missing values, it is believed that the remaining data is prepared for a thorough analysis.
 

