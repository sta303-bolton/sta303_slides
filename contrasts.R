## Dummy variables

Let's take a quick detour before we explore the next tests. We'll need to understand the concept of dummy variables and contrasts first.

### The matrices we use for linear regression

Recall that we can express our linear regression in matrix form: 
  
  $$\mathbf{y} = X\boldsymbol\beta + \boldsymbol\varepsilon$$
  
  where

$$
  \mathbf{y} = \begin{pmatrix} 
y_1 \\\ 
y_2 \\\ 
\vdots \\\ 
y_n 
\end{pmatrix} ,
$$
  $$
  \boldsymbol\beta = \begin{pmatrix} \beta_0  \\\ \beta_1  \\\ \beta_2  \\\ \vdots  \\\ \beta_p \end{pmatrix}, \quad
\boldsymbol\varepsilon = \begin{pmatrix} \varepsilon_1  \\\ \varepsilon_2  \\\ \vdots  \\\ \varepsilon_n \end{pmatrix}
$$
  
  and 

$$X = \begin{pmatrix} \mathbf{x}^\mathsf{T}_1 \\ \mathbf{x}^\mathsf{T}_2 \\ \vdots \\ \mathbf{x}^\mathsf{T}_n \end{pmatrix}
= \begin{pmatrix} 1 &  x_{11} & \cdots & x_{1p} \\
1 & x_{21} & \cdots & x_{2p} \\
\vdots & \vdots & \ddots & \vdots \\
1 & x_{n1} & \cdots & x_{np}
\end{pmatrix}$$
  
  We often talk about **X** as the **model matrix**  (or design or regressor matrix) and it will be the focus of this section.

### Getting our model matrix in R

Let's start by fitting a model with `body_mass_g` as the response and `flipper_length_mm` and `species` as the predictor variables.

(Note: Users of statistics use a lot of different words to refer to the same thing. Can you think of other terms people might use instead of _response_ and _predictor_?)

```{r modmat1, exercise = TRUE}
mod4 <- _________
summary(mod4)
```


```{r modmat1-solution}
mod4 <- lm(body_mass_g ~ flipper_length_mm + species, data=penguins)
summary(mod4)
```

```{r modmat1-check}
mod4 <- lm(body_mass_g ~ flipper_length_mm + species, data=penguins)
summary(mod4)
grade_result(
  pass_if(~identical(.result, summary(mod4)))
)
```

Now we can use the `model.matrix()` function to extract the model matrix for `mod4`.

```{r modmat2, exercise=TRUE, exercise.setup = "modmat1-solution"}

```

```{r modmat2-hint}
# mod4 is the only argument you need to pass to model.matrix
```

```{r modmat2-solution}
model.matrix(mod4)
```

```{r modmat2-check}
mod4 <- lm(body_mass_g ~ flipper_length_mm + species, data=penguins)
summary(mod4)
grade_result(
  pass_if(~identical(.result, model.matrix(mod4)))
)
```

You'll notice that even though we only had an intercept and two variables, we have four columns in our model matrix. You should also notice that R has given the columns helpful names, and that we have a column for the Chinstrap species and the Gentoo species, but not the Adelie species.

Further, recall that when we are working with a categorical variables we call the different values the the variables can take ''**levels"**. I may also refer to these as factor variables, and talk about the ''levels of the factor". 

What R is doing is dropping the first level (alphabetically) of the categorical variable and then creating **dummy variables** for each of the other levels.

The dropped level becomes our **reference level** and this should be familiar from interpreting summary output in previous courses where you have conducted multiple linear regressions with categorical variables. 

A dummy variable is also called an indicator variable, and it *indicates* whether or not the given observation takes that level or not. I.e., if the 40th penguin in this dataset had a 1 in the speciesGentoo column, then I know it is a Gentoo penguin, and that it won't have a 1 in the speciesChinstrap column because each penguin can only have one species.

More generally, the sum across the row of the dummy variables for one categorical variable will either be 0 (if that observation has the reference level) or 1 (not the reference level) but you will never have more than one 'one' amongst the dummies for a given categorical variable.

#### Why do we have to drop one of the levels?

You may recall that for the matrix calculations requried to get our vector of $\beta$s, we need to be able to invert our matrix. We can only invert linearly independent matrices and if we have the intercept AND dummies for all the levels of the categorical variable, our matrix 


### Contrasts

#### Dummy coding

#### Simple coding

#### Deviation coding