# ⌚ Bellabeat Smart Wellness Device Analysis: Health Insights for Women

## 📋 Project Overview
As part of the **Google Data Analytics Professional Certification**, I analyzed smart device fitness data from non-Bellabeat users to identify distinct consumer behavior trends across activity tracking and sleep habits. The goal of this analysis was to provide high-level, data-driven marketing and product feature recommendations to help Bellabeat successfully capture global growth opportunities and expand its digital wellness ecosystem.

---

## 🏢 Business Context & Organizational Background

### 🚀 **Project Introduction & Scenario**
As a Junior Data Analyst on the Bellabeat marketing analytics team, I conducted this case study to help guide the company's future global growth and marketing strategies. By analyzing public, non-Bellabeat smart wearable fitness data, this project uncovers deep consumer behavioral trends across daily activity, sleep patterns, and physical energy dynamics. These data-driven insights are designed to help executive leadership—specifically co-founder and Chief Creative Officer Urška Sršen—refine core product features, optimize user engagement, and craft highly targeted digital campaigns to scale up Bellabeat's global market presence. To systematically answer our core business questions, the project adheres to the standard six-step data analysis framework: **Ask, Prepare, Process, Analyze, Share, and Act**.

### **Organizational Context & Product Ecosystem**
Founded in 2013, Bellabeat has rapidly evolved into a leading tech-driven wellness company empowering women worldwide with actionable knowledge about their health and habits. Bellabeat distinguishes itself in the industry through beautifully designed, female-focused smart technology. The ecosystem includes:
* **Bellabeat App:** The central digital platform providing users with real-time health metrics related to daily activity, sleep, stress, and mindfulness habits.
* **Leaf & Time:** Classic, high-style wellness trackers and timepieces engineered to monitor user movement patterns and sleep metrics.
* **Spring:** A smart water bottle that logs daily hydration levels using integrated smart tracking technology.
* **Bellabeat Membership:** A premium subscription-based platform offering 24/7 personalized guidance on nutrition, activity, and sleep recovery custom-tailored to each individual user's lifestyle and wellness goals.

---

## 🛠️ Data Analysis Framework

### **Phase 1: Ask**

#### **Business Task**
Analyze public, non-Bellabeat smart device usage data to identify clear consumer behavioral trends and provide high-level, data-backed marketing and product recommendations to optimize Bellabeat's global positioning.

#### **Core Analytical Questions**
1. What are the prominent, recurring trends identified in smart device usage?
2. How can these behavioral trends be strategically applied to Bellabeat customers?
3. In what ways can these uncovered trends help influence and refine Bellabeat’s digital marketing strategy?

### **Phase 2: Prepare**

#### **Data Source Description**
The primary dataset utilized for this study is the public **[FitBit Fitness Tracker Data](https://www.kaggle.com/datasets/arashnic/fitbit)** (CC0: Public Domain, made available by Mobius on Kaggle). This crowdsourced dataset contains personal health-monitoring metrics from eligible Fitbit users who explicitly consented to submit minute-level tracker output data. The collection period covers a compact **31-day window**, capturing localized transactional records for daily activity steps, sleep monitoring cycles, and physical effort tracked via Metabolic Equivalent of Task (METs) values.

#### **Data Limitations**
* **Sample Size Constraints:** The dataset captures a small sample size consisting of only **33 unique user IDs** represented across the primary tables.
* **Demographic Gaps:** The source data lacks baseline demographic markers, such as age, geographic location, or gender-specific attributes.
* **Mitigation Strategy:** To offset these structural scope tracking limitations and minimize statistical skew, individual transactional records were heavily aggregated into group-level metrics, focusing specifically on macro-level behavioral trends across the recurring days of the week.

#### **Data Organization & Variable Definitions**
The source data was extracted across multiple tracking tables and consolidated. The key operational variables used throughout this analysis are structured as follows:

<img width="556" height="692" alt="image" src="https://github.com/user-attachments/assets/ffad3dfa-5894-4cd6-a5f3-c523c1fbe944" />

## 🏗️🛠️ Phase 3: Process (Data Cleaning & Transformation)

To ensure high data integrity, strict analytical consistency, and absolute dashboard readiness, all transactional tracking datasets were processed and engineered using **SQL Server Management Studio (SSMS)** across the collection period. The core data engineering and pipeline preparation steps included:

* **Handling Incompleteness:** Identified and removed rows containing null values or structural zeros across key physical activity metrics to prevent data distortion or artificial skewing during macro-aggregations.
* **Data De-duplication:** Filtered out duplicate entry logs and eliminated overlapping transactional timestamp records across daily sleep sequences. This established clean, singular daily observation rows per unique user ID.
* **Date & Aggregation Alignment:** Extracted explicit weekday classifications (`Day Of Week`) from the raw dates to map and evaluate group behavioral patterns systematically across the repeating 7-day cycle.
* **Calculated Feature Engineering:** Formulated a custom variance metric to isolate nightly restlessness and evaluate sleep hygiene efficiency:
  $$\text{Avg Wasted Bed Time Min} = (\text{Avg Time Bed Hour} - \text{Avg Sleep Time Hour}) \times 60$$
* **Algorithmic Customer Segmentation:** Programmed a logical conditional breakdown to categorize users into four distinct behavioral and lifestyle archetypes based on their baseline daily step volume thresholds:
  * **Sedentary**
  * **Lightly Active**
  * **Fairly Active**
  * **Very Active**

### **Phase 4: Analyze (Dashboard 1 Visualizations)**

#### **Figure 1: Distribution of Total Study Participants Across Active Lifestyle Tiers**

<img width="1605" height="602" alt="image" src="https://github.com/user-attachments/assets/e5895881-54da-43fd-8590-e3554319a529" />


A clean donut chart categorizes the high-level user demographics of the study sample based on their recorded activity levels. The total participant group ($n = 33$) is split into four distinct, color-coded behavioral segments derived from their daily movement volume: **Fairly Active** (9 users), **Lightly Active** (9 users), **Sedentary** (8 users), and **Very Active** (7 users).

##### **Key Analytical Insights & Findings:**
* **Dominance of Lower-Activity Tiers:** Over half of the tracked user base (nearly **51.5%**) falls into the *Sedentary* or *Lightly Active* categories. This establishes that the majority of the target market struggles to maintain robust baseline movement throughout the day.
* **Product Strategy Implication:** Since the largest user clusters are concentrated in lower-activity zones, Bellabeat does not need to market heavily to ultra-marathoners or elite fitness enthusiasts. Instead, the primary customer acquisition and retention opportunity lies in providing accessible scaffolding, lifestyle features, and actionable guidance to help the sedentary and lightly active majorities gradually build healthier daily habits.

#### **Figure 2: Weekday Volume Trends in Daily Step Counts Across the Study Group**

<img width="1691" height="730" alt="image" src="https://github.com/user-attachments/assets/9417b694-a0ca-46b1-b5a2-7a808ff2851a" />


A sorted column chart illustrates the fluctuating patterns of physical activity—measured in average daily steps—across different days of the week for the tracked consumer base. The bars are dynamically colored based on volume intensity (utilizing the *Daily Steps Scale* gradient) and are clearly labeled with their respective integer values: **Tuesday (1,207)**, **Wednesday (1,108)**, **Thursday (1,064)**, **Saturday (988)**, **Friday (917)**, **Monday (913)**, and **Sunday (820)**.

##### **Key Analytical Insights & Findings:**
* **The Mid-Week Peak:** Physical activity aggressively concentrates in the middle of the work week, hitting its absolute maximum on Tuesday (1,207 steps). This indicates that users maintain a more disciplined, active routine during their structured weekly commitments.
* **The Weekend Slump:** Contrary to the common assumption that people exercise more during their free time, activity trends downward into the weekend, bottoming out severely on Sunday (820 steps).
* **Product Strategy Implication:** This clear behavioral pattern exposes a major engagement vulnerability. Bellabeat can leverage these timing dynamics by designing localized smart notifications. Pushing tailored motivational cues or weekend walking challenges through the app on Friday afternoons can directly counter this recurring weekend drop-off, helping users smooth out their consistency gap.

#### **Figure 3: Combined Analysis of Cumulative Group Distance Covered and Caloric Burn by Weekday**

<img width="1562" height="727" alt="image" src="https://github.com/user-attachments/assets/7d32f170-30b3-496e-83cd-0c8a584fa47b" />


A dual-axis combination chart evaluated the direct relationship between physical movement and energy expenditure by aggregating the daily volume metrics of the study group across the tracking window. The horizontal axis displays the chronological flow of the week from Sunday to Saturday. The primary vertical axis on the left tracks the cumulative distance covered by the study group in miles, while the secondary vertical axis on the right measures the cumulative group calories burned. The visualization maps a line graph overlaid across structured bar marks to assess volumetric correlations over the 31-day study period.

##### **Key Analytical Insights & Findings:**
* **Flawless Volumetric Covariance:** The visualization displays a direct, parallel covariance between physical displacement metrics and energy output. When the group's collective distance peaks on Tuesday at **28.59 cumulative miles**, the total group energy expenditure hits its corresponding maximum at **11,552 total calories burned**.
* **The Friday Calorie Divergence:** A noticeable variance occurs on Fridays; while the collective distance covered drops significantly to **21.58 miles** (closely matching Sunday's low tracking volume), caloric expenditure remains resiliently elevated at **9,478 total calories**. This structural divergence indicates that on Fridays, participants heavily engage in stationary, high-exertion physical activities (such as resistance weight training, circuit training, or stationary cycling) that burn substantial calories without accumulating forward travel distance. 
* **Weekend Extrapolations:** As Friday evenings mark the beginning of the weekend, it is assumed that more participants utilize available free time for stationary gym or training center sessions. Similar trends continue into Saturday and Sunday, with Sunday ultimately recording both the absolute lowest distance covered (**19.62 miles**) and the minimum number of calories burned (**8,833**).
* **Product Strategy Implication:** This insight mathematically proves that raw mileage or step counts do not capture the complete story of consumer fitness. Bellabeat should center its marketing messaging on the comprehensive, holistic tracking capabilities of its ecosystem. By showcasing how the Bellabeat App syncs seamlessly with hardware devices to accurately credit women for high-intensity calorie burns during non-distance activities (such as yoga, pilates, or strength training), the company can position its products as true premium wellness companions rather than basic pedometers.

#### **Figure 4: Comparative Breakdown of Average Daily Steps by Active Lifestyle Tiers**

<img width="1622" height="728" alt="image" src="https://github.com/user-attachments/assets/bb28625b-d168-4f5a-8828-7b14436058f4" />


A sorted horizontal bar chart contrasts the stark performance gaps between the four user lifestyle segments established in the participant demographic distribution[cite: 2]. The vertical axis organizes the consumer segments cleanly from highest to lowest volume output, while the horizontal axis measures the baseline Average Daily Steps[cite: 2]. Each bar is explicitly labeled on its inside right margin with its precise calculated average value: **Very Active (12,487 steps)**, **Fairly Active (8,681 steps)**, **Lightly Active (6,566 steps)**, and **Sedentary (2,936 steps)**[cite: 2].

##### **Key Analytical Insights & Findings:**
* **The Performance Disparity:** The visualization exposes an aggressive **325% performance drop** between the *Very Active* tier and the *Sedentary* tier[cite: 2]. Sedentary users are failing to meet minimum standard clinical health recommendations for daily movement (10,000 steps), averaging well under 3,000 steps per day[cite: 2].
* **The High-Potential Target:** The *Lightly Active* (6,566 steps) and *Fairly Active* (8,681 steps) segments represent a massive "bridge" audience[cite: 2]. Because these users are already wearing their smart devices and exhibiting consistent baseline movement habits, they do not require a massive lifestyle overhaul—only minor behavioral adjustments—to cross the threshold into optimal daily activity[cite: 2].
* **Product Strategy Implication:** This metric highlights that a "one-size-fits-all" fitness goal is intimidating and ineffective for a diverse consumer base[cite: 2]. Bellabeat should use these insights to market personalized, tiered milestone achievements within its app interface[cite: 2]. Rather than pushing a sedentary user to immediately aim for 10,000 steps, the app should reward incremental progression (for example: leveling up from the Sedentary baseline to a Lightly Active 5,000-step milestone), gamifying the consumer journey to build long-term user retention and product loyalty[cite: 2].

## 🛠️ Technical Workflow

### 1. Data Processing (SQL) 🏗️
I used SQL Server Management Studio (SSMS) to aggregate, clean, and transform the tracking datasets across a 30-day collection period.
* **Data De-duplication:** Identified and eliminated overlapping transactional records to secure clean, singular daily sleep observations per user.
* **Feature Engineering:** Calculated a custom variance column to isolate nightly restlessness: 
  $$\text{Wasted Bed Time Mins} = (\text{Time in Bed Hour} - \text{Hours Slept Hour}) \times 60$$
* **Customer Segmentation:** Programmed an algorithmic breakdown to categorize users into distinct lifestyle tiers (`Sedentary`, `Lightly Active`, `Fairly Active`, `Very Active`) based on daily step thresholds.

### 2. Analysis & Visualization (Tableau) 📊
The structured query outputs were imported into Tableau Desktop to build an executive-level, dual-dashboard reporting suite focusing on user activity trends, sleep hygiene, and physiological energy metrics.

## 💡 Key Insights & Findings

* **The Segment Opportunity:** A major proportion (**51.5%**) of the tracked user base falls within the *Sedentary* and *Lightly Active* profiles, highlighting a massive market segment ripe for healthy lifestyle guidance.
* **The Performance Chasm:** Metrics reveal a severe performance variance between groups. *Very Active* users average an exceptional **12,487 steps per day**, while *Sedentary* users fall drastically behind at just **2,936 steps**.
* **The Weekend Slump:** Group activity tracking is not uniform. Physical movement peaks aggressively mid-week on **Tuesdays (activity index: 1,207)**, but steadily drops as users lose weekly routine structure, bottoming out on **Sundays (activity index: 820)**.
* **Systemic Sleep Inefficiency:** Visual alignments prove a profound gap between behavioral intent and true physiological rest. Users regularly dedicate 7 to 9 optimal hours to being in bed while capturing under 6 hours of actual sleep.
* **The Restless Outlier:** Pareto distribution analysis isolates severe individual sleep vulnerabilities, highlighting an extreme outlier losing an average of **309 minutes (over 5 hours) every single day** lying awake inside the bedding frame.

## 🚀 Recommendations

* **"Sleep Hygiene" Optimization Module:** Develop in-app software features—such as automated evening wind-down reminders, guided mindfulness sessions, and ambient sleep-induction soundscapes—to directly target the widespread **39 to 52-minute** intermediate restlessness bottleneck.
* **"Mid-Week Momentum" Smart Notifications:** Deploy automated haptic nudge notifications via the *Leaf* or *Time* smart wearable line on Friday afternoons. Incentivizing a personalized "Weekend Warrior" milestone challenge directly disrupts the predictable drop-off observed during the Sunday step slump.
* **Gamified Step Tier Transitions:** Rather than intimidating the **51.5% sedentary/lightly active consumer majority** with a rigid 10,000-step expectation, implement an incremental milestone interface inside the app that celebrates and rewards micro-progression thresholds to secure long-term user retention.
* **Exertion-Based Premium Monetization:** Leverage the proven predictive accuracy of the tracker's MET metrics to drive subscriptions for the *Bellabeat Membership*. The platform can automatically push personalized post-workout recovery guides and custom nutritional pacing content immediately following a verified high-exertion day.

## 📂 Repository Structure

* **Datasets/:** Contains subfolders for original raw transactional tracker data and processed SQL output CSV tables.
* **Scripts/:** Production-grade SQL query files used for data cleaning, aggregation, and customer segmentation.
* **Visualizations and Dashboards/:** High-resolution dashboard snapshots and individual component chart assets exported from the visualization workspace.
* **Workbook/:** The final interactive `.twbx` Tableau Packaged Workbook containing all custom axis scales, filters, and design formatting.
* **Report/:** The definitive case study analysis report in PDF format alongside the project guidelines.
