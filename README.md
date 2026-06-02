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

### **Phase 4: Analyze** 

**Dashboard 1 Visualizations:**

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


A sorted horizontal bar chart contrasts the stark performance gaps between the four user lifestyle segments established in the participant demographic distribution. The vertical axis organizes the consumer segments cleanly from highest to lowest volume output, while the horizontal axis measures the baseline Average Daily Steps. Each bar is explicitly labeled on its inside right margin with its precise calculated average value: **Very Active (12,487 steps)**, **Fairly Active (8,681 steps)**, **Lightly Active (6,566 steps)**, and **Sedentary (2,936 steps)**.

**Dashboard 2 Visualizations:**

#### **Figure 5: Physiological Relationship Between Total Energy Exertion (METs) and Daily Calories Burned**

<img width="1673" height="735" alt="image" src="https://github.com/user-attachments/assets/5d9d4917-c392-400f-be6b-d97efe2e7a71" />


A scatter plot maps the mathematical relationship between physical effort and metabolic output across the study group. The horizontal axis measures Total Energy Exertion (METs), custom-scaled from 25,000 to 40,000 to eliminate empty chart space and focus entirely on the active data cluster. The vertical axis tracks Daily Calories Burned, ranging from 0 to 4,500. A solid, upward-sloping linear regression trend line is overlaid across the individual user data points to model the predictability of the correlation.

##### **Key Analytical Insights & Findings:**
* **Unmistakable Positive Correlation:** The visualization demonstrates an undeniable, direct positive correlation between systemic physical exertion and caloric expenditure. As a user's accumulated MET score increases along the horizontal axis, their daily calorie burn climbs reliably in tandem.
* **The Variance of True Exertion:** Zooming the axis into the 25,000 to 40,000 MET range exposes the true variance in user behavior. It highlights that the most active individuals are consistently burning between 3,500 and 4,000 calories per day, driven entirely by sustained physical effort rather than baseline resting metabolism alone. It also clearly flags a single low-performing outlier who, despite accumulating over 32,000 METs, experienced a significantly lower caloric burn of roughly 2,600 calories, indicating potential individual baseline variations.
* **Product Strategy Implication:** This chart provides a powerful talking point for Bellabeat's marketing and software engineering teams. It mathematically proves that the tracker's internal proprietary algorithms are accurately anchoring calorie metrics to verified physiological exertion (METs). Bellabeat should feature this predictive accuracy when marketing its premium Membership platform. By showcasing how the app translates hard hardware tracker data into clear, scientifically sound metabolic insights, Bellabeat can build trust with women who want an honest, highly accurate view of their daily energy expenditure and workout efficiency.

##### **Key Analytical Insights & Findings:**
* **The Performance Disparity:** The visualization exposes an aggressive **325% performance drop** between the *Very Active* tier and the *Sedentary* tier. Sedentary users are failing to meet minimum standard clinical health recommendations for daily movement (10,000 steps), averaging well under 3,000 steps per day.
* **The High-Potential Target:** The *Lightly Active* (6,566 steps) and *Fairly Active* (8,681 steps) segments represent a massive "bridge" audience. Because these users are already wearing their smart devices and exhibiting consistent baseline movement habits, they do not require a massive lifestyle overhaul—only minor behavioral adjustments—to cross the threshold into optimal daily activity.
* **Product Strategy Implication:** This metric highlights that a "one-size-fits-all" fitness goal is intimidating and ineffective for a diverse consumer base. Bellabeat should use these insights to market personalized, tiered milestone achievements within its app interface. Rather than pushing a sedentary user to immediately aim for 10,000 steps, the app should reward incremental progression (for example: leveling up from the Sedentary baseline to a Lightly Active 5,000-step milestone), gamifying the consumer journey to build long-term user retention and product loyalty.

#### **Figure 6: Comparative Analysis of Total Time Spent in Bed vs. Actual Hours Slept**

<img width="1532" height="727" alt="image" src="https://github.com/user-attachments/assets/f9b423ae-6e5e-47f5-b523-040148f03648" />

A nested thermometer-style bar chart illustrates the relationship between behavioral sleep intent and actual physiological rest for individual participants across the study group. The vertical axis measures duration in hours (scaled from 0 to 16 hours), while the horizontal axis displays unique tracking records across the month. The visualization takes into account the average time spent in bed alongside the average estimate of actual hours slept. For each tracking record, a narrow blue bar (*Actual Hours Slept*) is nested directly inside a wider orange bar (*Time Spent in Bed*), creating an immediate visual indicator of individual sleep efficiency.

> **Note:** Data labels were intentionally excluded from this visualization to maintain a clean, high-density layout and prevent text overlapping. Instead of tracking exact numerical values for every record, the visualization relies on the relative height difference between the nested bars to tell the story. Whenever an orange bar towers significantly over its nested blue bar, it visually quantifies an instance of poor sleep efficiency.

##### **Key Analytical Insights & Findings:**
* **The Persistent Structural Gap:** The chart exposes a widespread, systemic gap across nearly all tracking records. While users consistently dedicate an optimal 7 to 9 hours of time to being in bed, their actual hours of sleep frequently drop below 6 hours, and in severe instances, plummet to under 4 hours.
* **The Boundless Sleep Anomaly:** A prominent behavioral outlier is captured on the far left of the chart. This individual spent an extraordinary 16 total hours in bed, yet only achieved nearly 11 hours of actual sleep. This proves that simply extending time spent in bed does not automatically result in proportional, restorative rest.
* **Product Strategy Implication:** This structural insight provides a clear roadmap for Bellabeat's marketing and software engineering teams. The data proves that customers do not necessarily need to be told to go to bed earlier; rather, they need active support optimizing the time they already spend in bed. Bellabeat should use this finding to promote in-app sleep hygiene features, such as automated bedroom wind-down reminders, guided breathing exercises, or smart alarms that monitor sleep cycles. Bellabeat should position its ecosystem as an active tool for sleep optimization rather than a passive data logger.

#### **Figure 7: Pareto Distribution of Average Wasted Time in Bed Across Individual Users**

<img width="1688" height="732" alt="image" src="https://github.com/user-attachments/assets/007c0f9e-175b-4b37-9632-659a406a3398" />


The analysis visualizes sleep inefficiency by tracking the average daily minutes users spend awake, restless, or unable to fall asleep while lying in bed, as documented in `image_b8e221.png`. The vertical axis measures *Avg Wasted Bed Time in Mins*, ranging from 0 to 340 minutes. The horizontal axis organizes individual tracking participants in a strict descending order from highest to lowest duration of wasted time. The columns are dynamically shaded using a deep crimson-to-pink gradient to emphasize the severity of individual sleep loss.

##### **Key Analytical Insights & Findings:**
* **The Extreme Outlier:** The visualization highlights a massive, severe outlier on the far left of the distribution, as shown in `image_b8e221.png`. This specific individual wastes an average of **309 minutes (over 5 hours)** every single day lying awake in bed. This represents a catastrophic sleep continuity issue that severely impacts overall wellness and daily energy levels.
* **The Secondary Risk Cluster:** Beyond the primary outlier, a secondary high-risk cluster emerges, with users losing **167 minutes (nearly 3 hours)** and **52 minutes** per day respectively. The rest of the study group stabilizes into a long tail, gradually tapering down from 44 minutes to a highly efficient 3 minutes of wasted time.
* **Product Strategy Implication:** This ranked distribution provides the ultimate behavioral justification for Bellabeat's marketing focus. It demonstrates that sleep vulnerability is highly individualized and skewed toward severe acute cases. Bellabeat should use these metrics to pitch the necessity of personalized, automated health alerts. For example, if the app detects a user entering the high-risk zone (averaging more than 45 minutes awake in bed over a rolling 3-day period), it should automatically trigger a "Sleep Optimization Intervention"—prompting the user to log lifestyle factors in the app or offering targeted mindfulness and stress-reduction content to help minimize restlessness.

## 📊 Phase 5: Share (Dashboard 1)

### **Figure 8: Activity & Engagement Dashboard (01_Dashboard 1)**
The executive-level business intelligence suite compiled in Tableau Desktop consolidates key physical performance metrics and behavioral trends, as displayed in `image_b888918.png`. This interactive reporting layer maps the clear relationship between baseline user segmentation, routine workflow schedules, and metabolic outputs.

#### **Key Findings from Dashboard 1 (`image_b888918.png`):**

<img width="1920" height="807" alt="image" src="https://github.com/user-attachments/assets/f97a5839-9fc7-4ba3-abaa-f58ab76adad7" />

* **User Segment Distribution:** The consumer demographic profile is highly diverse across the tracked cohort ($n = 33$). The user base is distributed into explicit behavioral tiers: **8 Sedentary users**, **9 Lightly Active users**, **9 Fairly Active users**, and **7 Very Active users**. Combined, *Sedentary* and *Lightly Active* individuals comprise over half (**51.5%**) of the target market, highlighting a massive addressable audience requiring proactive behavioral scaffolding and health-improvement tracking.
* **Average Steps by User Tier:** Performance metrics expose an aggressive operational disparity between user lifestyle groups. *Very Active* consumers demonstrate exemplary fitness habits, averaging an exceptional **12,487 steps per day** and easily outpacing standard clinical recommendations. Conversely, *Sedentary* users fall drastically behind, averaging a minimal **2,936 steps per day**.
* **Weekday Activity Trends:** Group volume distributions establish that physical movement is heavily impacted by the structure of the weekly cycle. Active engagement concentrates sharply during mid-week operations, hitting an index peak of **1,207 steps on Tuesdays**. However, tracking metrics steadily decline as users enter the weekend, bottoming out into a severe activity slump on **Sundays at an index low of 820**.
* **Distance vs. Calories Burned:** A dual-axis combination analysis shows a flawless direct correlation and visual covariance between forward physical displacement (miles) and energetic output (calories). On peak Tuesdays across the 31-day monitoring window, the study group’s cumulative distance scaled up to **28.59 miles**, corresponding directly with a group energy expenditure maximum of **11,552 total calories burned**.

## 📊 Phase 5: Share (Dashboard 2)

### **Figure 9: Sleep & Energy Dynamics Dashboard (02_Dashboard 2)**

<img width="1920" height="847" alt="image" src="https://github.com/user-attachments/assets/915c8b57-9143-441b-907a-fe405cca51e4" />

The second reporting tier engineered in Tableau Desktop consolidates physiological metrics and sleep behaviors, as captured in `image_b88198.png`. This dashboard acts as a deep dive into individual rest patterns and metabolic energy trends to isolate health vulnerabilities across the user cohort.

#### **Key Findings from Dashboard 2 (`image_b88198.png`):**
* **Total Time Spent in Bed vs. Actual Hours Slept:** Thermometer chart indicators confirm a profound, widespread gap between behavioral sleep intent and actual physiological recovery. While users allocate a consistent, healthy baseline averaging 7 to 8 total hours in bed, their actual duration spent asleep drops significantly lower—frequently falling below 6 hours or plummeting into acute sleep deficits.
* **Wasted Time in Bed Analysis:** By isolating restlessness and awake intervals via a ranked Pareto distribution, severe individual variance in sleep efficiency is exposed. A critical, extreme outlier is highlighted wasting a staggering **309 minutes (over 5 hours)** awake in bed daily, while a secondary risk cluster averages between **39 and 52 minutes** of wasted time per night. This quantifies a systemic, community-wide sleep hygiene issue that undermines consumer wellness.
* **Daily Energy vs. Calories:** The physiological scatter plot tracks a high-density data cluster positioned between **30K and 38K METs**. The positive slope of the overlaid linear regression trend line mathematically demonstrates that daily calorie burn is reliably and predictably driven by sustained, high-intensity physical exertion (Total Energy Exertion (METs)), providing clear validation of tracking accuracy.

## 💡 Key Insights & Findings

* **The Segment Opportunity:** A major proportion (**51.5%**) of the tracked user base falls within the *Sedentary* and *Lightly Active* profiles, highlighting a massive market segment ripe for healthy lifestyle guidance.
* **The Performance Chasm:** Metrics reveal a severe performance variance between groups. *Very Active* users average an exceptional **12,487 steps per day**, while *Sedentary* users fall drastically behind at just **2,936 steps**.
* **The Weekend Slump:** Group activity tracking is not uniform. Physical movement peaks aggressively mid-week on **Tuesdays (activity index: 1,207)**, but steadily drops as users lose weekly routine structure, bottoming out on **Sundays (activity index: 820)**.
* **Systemic Sleep Inefficiency:** Visual alignments prove a profound gap between behavioral intent and true physiological rest. Users regularly dedicate 7 to 9 optimal hours to being in bed while capturing under 6 hours of actual sleep.
* **The Restless Outlier:** Pareto distribution analysis isolates severe individual sleep vulnerabilities, highlighting an extreme outlier losing an average of **309 minutes (over 5 hours) every single day** lying awake inside the bedding frame.

## 🚀 Phase 6: Act (Strategic Recommendations)

Based on the behavioral trends and physiological insights uncovered across consumer activity patterns and sleep dynamics, I recommend the following targeted marketing and product development strategies for Bellabeat:

### **1. Introduce an In-App "Sleep Hygiene Optimization" Module (Product Expansion)**
* **The Insight:** Our analysis identifies a critical commercial opportunity regarding hidden sleep inefficiencies. As demonstrated in the ranked distribution (`image_b8e221.png` & `image_b88198.png`), individual users waste up to **309 minutes (over 5 hours)**, with a secondary cluster averaging **39 to 52 minutes** daily lying awake or restless in bed. 
* **The Strategy:** Bellabeat should market premium software expansions within the Bellabeat App. Features should include automated bedroom wind-down reminders, sleep-induction soundscapes, and guided evening mindfulness sessions. This directly addresses a widespread, data-proven consumer pain point using targeted product features rather than simple data logging.

### **2. Deploy "Mid-Week Momentum" Smart Notifications (Targeted Engagement)**
* **The Insight:** Group tracking data shows that physical activity aggressively peaks on **Tuesdays (activity index: 1,207 steps)** and suffers a severe slump over the weekend, bottoming out on **Sundays (activity index: 820 steps)**.
* **The Strategy:** To smooth out this consistency gap, Bellabeat’s Leaf or Time smart wearables should leverage adaptive haptic nudges. Pushing personalized **"Weekend Warrior"** or **"Saturday Step-Up"** incentive notifications on Friday afternoons can proactively motivate users to maintain active habits precisely when their weekly routine loses structure.

### **3. Gamify Step Tier Transitions (User Retention)**
* **The Insight:** A massive performance disparity exists between the *Sedentary* tier (**2,936 average steps**) and the *Fairly Active* tier (**8,681 average steps**), proving that a single, rigid clinical goal (like 10,000 steps) can be intimidating to a majority of consumers. *Sedentary* and *Lightly Active* individuals comprise **51.5%** of our tracked user segment (`image_b888918.png`).
* **The Strategy:** Bellabeat should introduce an incremental, gamified milestone progression framework within the app interface. Rewarding users with digital badges or community recognition for graduating from Sedentary to Lightly Active (e.g., crossing a 5,000-step milestone) scales down entry intimidation and builds long-term brand loyalty.

### **4. Position the Bellabeat Membership via Predictive Exertion Metrics (Premium Monetization)**
* **The Insight:** The tight linear regression model mapping *Total Energy Exertion (METs)* against *Daily Calories Burned* (`image_b88198.png`) proves that the ecosystem's internal calorie-tracking algorithms are highly accurate and tied directly to true physiological effort.
* **The Strategy:** Bellabeat should leverage this verified benchmarking accuracy to market its subscription-based **Bellabeat Membership**. Digital marketing campaigns should highlight how hardware data syncs seamlessly with the membership platform to instantly deploy automated, customized recovery metrics and personalized nutritional advice the moment the tracker logs a high-MET workout day.

---

## 🏁 Conclusion

This comprehensive analysis demonstrates that while high-performing users maintain optimal physical habits, the vast majority of smart device consumers face prominent behavioral barriers regarding weekend step consistency and nighttime sleep hygiene. While users actively utilize tracking wearables to log daily metrics, they clearly lack the behavioral scaffolding necessary to optimize their daily routines.

By strategically shifting marketing narratives away from passive device tracking, Bellabeat can focus on highly personalized, data-driven health optimization. Marketing campaigns should specifically target sleep efficiency, custom tier progression, and weekend engagement. This strategic pivot will allow Bellabeat to successfully capture high-potential wellness consumers globally. Ultimately, transitioning from a traditional hardware manufacturer to a holistic digital wellness partner will unlock massive new growth opportunities, securing Bellabeat's position as a premier leader in the global smart device market.

---

## 📂 Repository Structure

* **Datasets/:** Contains subfolders for original raw transactional tracker data and processed SQL output CSV tables.
* **Scripts/:** Production-grade SQL query files used for data cleaning, aggregation, and customer segmentation.
* **Visualizations and Dashboards/:** High-resolution dashboard snapshots and individual component chart assets exported from the visualization workspace.
* **Workbook/:** The final interactive `.twbx` Tableau Packaged Workbook containing all custom axis scales, filters, and design formatting.
* **Report/:** The definitive case study analysis report in PDF format alongside the project guidelines.
