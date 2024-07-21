# Superstore Sales Dashboard Analysis


## Overview:
This project focuses on analyzing the sales data of a Superstore. I created an interactive dashboard in Power BI, which provides insights into the sales and profitability of the retail store over several years.


Dataset:
The dataset used for this analysis is the Superstore Dataset from Kaggle. It contains information about sales, profit, and various other attributes related to the operations of a retail superstore.


### Dashboard Summary:
Provides an overview of the following key performance metrics:
1.	Total Sales Revenue: $2.3M
2.	Gross Profit Margin: $286K
3.	Revenue Growth Rate: 15.67%
4.	Profit Growth Rate: 23.78%
5.	Most Profitable Category: Technology

### Key Visuals
- ** Sales by Region: Displays sales figures broken down by different regions (West, East, Central, South).
- ** Profit by Category: Highlights profit figures across various product categories (Technology, Office Supplies, Furniture).
- ** Profit by Customer Type: Pie chart showing profit distribution among different customer types (Home Office, Corporate, Consumer).
- ** Top 5 Best Selling Products: Bar chart listing the top 5 products with the highest sales.
- ** Top 5 Most Profitable Products: Bar chart listing the top 5 products with the highest profit.
- ** Sales by Customer Type: Doughnut chart depicting sales figures by customer type.
- ** Total Sales Overtime: Line chart showing the trend of sales over the years from 2014 to 2017.
- ** Worst States: Bar chart highlighting the states with the lowest profitability.
- ** Best States: Bar chart highlighting the states with the highest profitability.


## Insights:
Regional Performance:
- The West region has the highest sales, followed by the East and Central regions. The South region has the lowest sales.

Category Profitability:
- Technology is the most profitable category, followed by Office Supplies. Furniture lags significantly behind in terms of profitability. Furniture category had the second highest revenue out of all the categories, however it was by far the least profitable. 

Customer Type Analysis:
- Consumer customers (customers buying for personal use) contribute the most to profit, followed by Corporate and Home Office customers.

Product Performance:
- Phones are the best-selling product, and Copiers are the most profitable product.

Geographical Insights:
- California and New York are the top-performing states in terms of profit, while Texas and Ohio are among the worst-performing states. Texas produced the second most revenue, but it was the least profitable and resulted in a loss. 



## Reccomendations:
Since Technology is the most profitable category followed by Office Supplies , I think the superstore should invest in marketing and sales efforts to further boost the sales of Technology and Office Supplies categories, as they are already highly profitable. 
For Furniture category, despite it being the second highest in revenue, it's by far the least profitable. The company needs to cut costs in this department. They should analyze the cost and pricing for the Furniture category and find areas where expenses can be reduced without compromising quality. Evaluate the supply chain and logistics to identify any inefficiencies to reduce expenses. The company should also consider discontinuing low-margin furniture items and focusing on high-margin ones.

Consumers are the company's biggest customers. They should develop marketing campaigns to target consumer customers.  Leverage consumer data on their purchasing behavior and preferences to personalize marketing campaigns.
Corporate customers were the next highest customers. The company can work on strengthing its relationships with corporate clients by offering bulk order discounts and incentives to increase repeat purchases and customer retention.

Phones are the best-selling product, and Copiers are the most profitable product. The company should capitalize on best-selling and profitable products by increasing inventory and availability of phones and copiers to meet the high demand and avoid stockouts.

California and New York are the top-performing states in terms of profit, while Texas and Ohio are among the worst-performing states. Texas produced the second most revenue, but it was the least profitable and resulted in a loss.
The company needs to conduct a detailed analysis of the costs and pricing strategies in Texas to identify factors contributing to the low profitability. Cost may need to be reduced. 
Invest into targeted marketing to low-performing states to increase sales. Continue to invest in marketing in California and New York to maintain and grow their high profitability.



Conclusion:
This dashboard provides valuable insights into the sales and profitability trends of the Superstore dataset. It highlights key areas of performance and identifies opportunities for improvement. By analyzing these metrics, stakeholders can make informed decisions to enhance the overall performance of the store.
By implementing these recommendations, the company can optimize its sales strategies, improve profitability, and enhance overall business performance. 






# PART II: Forecast

In this segment of the analysis, to better understand the factors influencing sales I conducted a regression analysis. I used the regression models to forecast sales and demand. 


### Models
I built a full linear regression model, a reduced model, and a transformed model to predict sales.
The transformed model, using a log transformation, showed the best performance, addressing issues with homoscedasticity and non-linearity.

### Residual Analysis
- ** Linearity and Homoscedasticity: The residuals are now more randomly scattered around the horizontal line, indicating an improvement in both linearity and homoscedasticity.
- ** Normality: The Q-Q plot and histogram of residuals show significant improvement in normality. The residuals follow the line more closely, although there are some deviations in the tails. The histogram shows a bell-shaped distribution, indicating that the residuals are not skewed.
- ** Outliers: There are no significant outliers, with all Cook's distance values below the threshold of 1. The influential outlier is no longer present, indicating that the transformation successfully reduced the 
influence of outliers on the model.

### Model Performance 
Reduced model: Adj R^2 =0.3447719
   MSE = 206300.2
  RMSE = 454.2029
Full model: Adj R^2 = 0.8922954
Transformed model: Adj R^2= 0.9797957
The transformed model explains approximately 98% of the variance in sales, significantly higher than the reduced and full models.


## Conclusion
The regression analysis helped me better understand what affects Superstore sales. The transformed model worked the best, fixing initial data problems and fitting the data well. This detailed analysis, along with the insights from Power BI, provides a strong basis for making strategic decisions to boost sales and identify growth opportunities for the Superstore. Using both visual analytics and statistical modeling shows the benefit of using different methods to get deeper insights and make decisions based on data.


