# stockvalue_prediction
Predicting the close value of stocks using data mining techniques

In this project, we are going to compare three algorithms: neural networks, regression and random forest. The accuracy of prediction of close price by each algorithm depends on the quality of the dataset and the data of each company i.e. one algorithm may work better for one company when compared to another one. We will compare the algorithms and come up with best algorithm to help us predict the stock price

Neural networks:
Mathematically, a neuron's network function f(x) is defined as a composition of other functions gi(x), which can further be defined as a composition of other functions. This can be conveniently represented as a network structure, with arrows depicting the dependencies between variables. A widely used type of composition is the nonlinear weighted sum, where 
 f(x)=K∑_i^n▒(w_i g_i (x)) , where K (commonly referred to as the activation function) is some predefined function, such as the hyperbolic tangent or sigmoid function. Here we use Hyperbolic tangent sigmoid function as activation function.

The prediction is mainly done by using the formula:
Y(close) = w0*(open)+w1*(high)+w2*(low)+w3(predicted close)
Where, w0, w1, w2, w3 are the weights of open, high, low and predicted close respectively.
We have implemented the project using this algorithm in two ways: one to predict the close value if the immediate previous close value is known and the other is to predict the close value using an already predicted close value. The network is trained using bayesian algorithm.
Regression:
Regression analysis is used to find the relationship among variables.  Generally, regression is used for forecasting trend and prediction. The target of regression is to find the function of independent variables which is known as regression function. In linear regression relationship between the dependent variable and independent variable is estimated. If number of independent variables is more than one in regression function, then this is known as multiple linear regression.  The general form of multiple linear regression is defined as 
yi = a0+a1xi,1+a2x i,2+a3x i,3+…………+apx i,p
for i=1 to n. In the above equation, x1,x2,…..xp are the predictor variables and the y is the dependent variable. a1,a2,…….ap  are the parameters with which the predictor variables are multiplied.
In this problem, the close price is taken as dependent variable and remaining variables such as open, high and low components are considered as predictor variables.
Y(close) =  a0+a1*(open)+a2*(high)+a3*(low)
The available data set is divided into two categories – Training data and testing data. Training data is used to find the parameters (a0,a1, a2,a3) of equation which are unknown. After finding the coefficients, testing is performed on testing data. The comparison is made between the predicted value and actual values using various graphs.
Random forest:
The prediction of stock prices has been a long researched and various people have come up with various methods. Here we propose the use of the RANDOM FOREST algorithm to effectively predict the stock prices of a company. In this model we make use of the stock opening, highest and lowest values of a company in a day to predict the stock closing price. Random forest algorithm makes use of decision trees to classify or predict the outcome.
Decision tree is a type of supervised learning algorithm. It can be used for categorical and continuous input and output variables. In this model, we split the population into two or more homogeneous sub-populations based on most significant differentiator in input variables. The Random Forest Algorithm grows a number of decision trees, and uses the output of all the trees to better predict the output. A random sample of the total population is selected to train each tree, and at each node a random group of variables to decide the split are selected and the best variable is used to carry out the split. New data is predicted by aggregating the predictions of all the trees i.e., in case of continuous variable the average of all the outputs is selected.
