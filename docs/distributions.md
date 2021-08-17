# Representing distributions {#representing-distributions}



This chapter introduces us to two more ways we can represent univariate (single variable) data distributions as we start to learn how to compare two or more distributions and draw conclusions.
So far we've focused on representing univariate distributions using frequency histograms (by default, `geom_histogram()` sorts data into different bins and tells you how many end up in each one).
Frequency histograms are useful for examining the particulars of a single variable, but have limited utility when directly comparing distributions that contain different numbers of observations.
We resolve this issue by introducing the normalized version of the frequency histogram, the **probability mass function** (PMF).
As we'll see, the PMF still has its limitations, which will motivate us to consider other, more robust representations of data distributions, such as the very useful **cumulative distribution function** (CDF).

```r
# Packages
library(dplyr)
library(ggplot2)
library(readr)
# Dataset
county_complete <- read_rds(path = "data/county_complete.rds")
```

## Probability mass functions

### Example dataset

We use an example dataset of the average time it takes for people to commute to work across 3143 counties in the United States (collected between 2006-2010) to help illustrate the meaning and uses of the probability mass function.
The frequency histogram for these times can be plotted using the following code snippet:

```r
county_complete %>%
  ggplot(mapping = aes(x = mean_work_travel)) +
  geom_histogram(binwidth = 1)
```

<img src="distributions_files/figure-html/mean-travel-time-freq-hist-1.svg" width="100%" style="display: block; margin: auto;" />

### PMFs

The **probability mass function** (PMF) represents a distribution by sorting the data into bins (much like the frequency histogram) and then associates a probability with each bin in the distribution.
A **probability** is a frequency expressed as a fraction of the sample size *n*.
Therefore we can directly convert a frequency histogram to a PMF by dividing the count in each bin by the sample size *n*.
This process is called **normalization**.

As an example, consider the following short sample,

```
1  2  2  3  5
```
    
If we choose a binwidth of 1, then we get a frequency histogram that looks like this:

<img src="distributions_files/figure-html/simple-freq-hist-1.svg" width="100%" style="display: block; margin: auto;" />

There are 5 observations in this sample.
So, we can convert to a PMF by dividing the count within each bin by 5, getting a histogram that looks like this:

<img src="distributions_files/figure-html/simple-pmf-hist-1.svg" width="100%" style="display: block; margin: auto;" />

The relative shape stays the same, but compare the values along the vertical axis between the two figures.
You'll find that they are no longer integers and are instead probabilities.
The normalization procedure (dividing by 5) guarantees that adding together the probabilities of all bins will equal 1.
For this example, we find that the probability of drawing the number 1 is 0.2, drawing 2 is 0.4, drawing 3 is 0.2, drawing 4 is 0, and drawing 5 is 0.2.
That is the biggest difference between a frequency histogram and a PMF, the frequency histogram maps from values to integer counters, while the PMF maps from values to fractional probabilities.

### Plotting PMFs

The syntax for plotting a PMF using [ggplot2]{.monospace} is nearly identical to what you would use to create a frequency histogram.
The one modification is that you need to include `y = ..density..` inside `aes()`.
As a simple example, let's take the full distribution of the average work travel times from earlier and plot it as a PMF:

```r
county_complete %>%
  ggplot(mapping = aes(x = mean_work_travel, y = ..density..)) +
  geom_histogram(binwidth = 1)
```

<img src="distributions_files/figure-html/mean-travel-time-pmf-1.svg" width="100%" style="display: block; margin: auto;" />

Let's do a comparison to show how one might use a PMF for analysis.
For example, we could ask if two midwestern states such as Nebraska and Iowa have the same distribution of work travel times, or if there is a meaningful difference between the two.
First, let's filter the dataset to only include these two states:


```r
nebraska_iowa <- county_complete %>%
  filter(state == "Iowa" | state == "Nebraska")
```

Now let's plot the frequency histogram:

```r
nebraska_iowa %>%
  ggplot() +
  geom_histogram(
    mapping = aes(
      x = mean_work_travel,
      fill = state,
      color = state
    ),
    position = "identity",
    alpha = 0.5,
    binwidth = 1
  )
```

<img src="distributions_files/figure-html/ia-ne-travel-times-freq-hist-1.svg" width="100%" style="display: block; margin: auto;" />

The `position = "identity"` input overlaps the two distributions (instead of stacking them) and `alpha = 0.5` makes the distributions translucent, so that you can see both despite the overlap.
On our first glance, it looks like the center of the Nebraska times is lower than the center of the Iowa times, and that both have a long tail on the right-hand side.
However, if we do a count summary,

```r
nebraska_iowa %>%
  count(state)
```

<table class="table table-striped table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> state </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Iowa </td>
   <td style="text-align:right;"> 99 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nebraska </td>
   <td style="text-align:right;"> 93 </td>
  </tr>
</tbody>
</table>

we find that the two states do not have the exact same number of counties, although they are close in this particular example.
Nonetheless, any comparisons should be done using a PMF in order to account for differences in the sample size.
We use the following code to create a PMF plot:

```r
nebraska_iowa %>% 
  ggplot() +
  geom_histogram(
    mapping = aes(
      x = mean_work_travel,
      y = ..density..,
      fill = state,
      color = state
    ),
    position = "identity", alpha = 0.5, binwidth = 1
  )
```

<img src="distributions_files/figure-html/ia-ne-travel-times-pmf-1.svg" width="100%" style="display: block; margin: auto;" />

The trend that the center of the travel times in Nebraska is slightly smaller than in Iowa continues to hold even after converting to a PMF.

To provide an example where a PMF is clearly necessary, what if we compare New Jersey with Virginia?
Virginia has many more counties than New Jersey:

```r
county_complete %>%
  filter(state == "New Jersey" | state == "Virginia") %>%
  count(state)
```

<table class="table table-striped table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> state </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> New Jersey </td>
   <td style="text-align:right;"> 21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Virginia </td>
   <td style="text-align:right;"> 134 </td>
  </tr>
</tbody>
</table>

As a result, comparing their frequency histograms gives you this:

<img src="distributions_files/figure-html/va-nj-travel-times-freq-hist-1.svg" width="100%" style="display: block; margin: auto;" />

The New Jersey distribution is dwarfed by the Virginia distribution and it makes it difficult to make comparisons.
However, if we instead compare PMFs, we get this:

<img src="distributions_files/figure-html/va-nj-travel-times-pmf-1.svg" width="100%" style="display: block; margin: auto;" />

So, for example, we can now make statements like "a randomly selected resident in New Jersey is twice as likely as a randomly chosen resident in Virginia to have an average work travel time of 30 minutes."
The PMF allows for an "apples-to-apples" comparison of the average travel times.

## Cumulative distribution functions

### The limits of probability mass functions

Probability mass functions (PMFs) work well if the number of unique values is small.
But as the number of unique values increases, the probability associated with each value gets smaller and the effect of random noise increases.

Let's recall that, in the previous reading, we plotted and compared PMFs of the average work travel time in Virginia and New Jersey, which resulted in this figure:

<img src="distributions_files/figure-html/va-nj-travel-times-pmf-1.svg" width="100%" style="display: block; margin: auto;" />

What happens if we choose `binwidth = 0.1` for plotting the `mean_work_travel` distribution?
The values in `mean_work_travel` are reported to the first decimal place, so `binwidth = 0.1` does not "smooth out" the data.
This increases the number of distinct values in `mean_work_travel` from 41 to 304.
The comparison between the Virginia and New Jersey PMFs will then look like this:

<img src="distributions_files/figure-html/mean-work-travel-pmf-no-rounding-1.svg" width="100%" style="display: block; margin: auto;" />

This visualization has a lot of spikes of similar heights, which makes this difficult to interpret and limits its usefulness.
Also, it can be hard to see overall patterns; for example, what is the approximate difference in means between these two distributions?

This illustrates the tradeoff when using histograms and PMFs for visualizing single variables.
If we smooth things out by using larger bin sizes, then we can lose information that may be useful.
On the other hand, using small bin sizes creates plots like the one above, which is of limited (if any) utility.

An alternative that avoids these problems is the cumulative distribution function (CDF), which we turn to describing next.
But before we discuss CDFs, we first have to understand the concept of percentiles.

### Percentiles

If you have taken a standardized test, you probably got your results in the form of a raw score and a **percentile rank**.
In this context, the percentile rank is the fraction of people who scored lower than you (or the same).
So if you are "in the 90th percentile", you did as well as or better than 90% of the people who took the exam.

As an example, say that you and 4 other people took a test and received the following scores:

```
55  66  77  88  99
```

If you received the score of 88, then what is your percentile rank?
We can calculate it as follows:


```r
test_scores <- data_frame(score = combine(55, 66, 77, 88, 99))
  
number_of_tests <- test_scores %>%
  count() %>%
  pull(n)
  
number_of_lower_scores <- test_scores %>%
  filter(score <= 88) %>%
  count() %>%
  pull(n)
  
percentile_rank <- 100.0 * number_of_lower_scores / number_of_tests
```

From this, we find that the percentile rank for a score of 88 is 80.
Mathematically, the calculation is \(100 \times \dfrac{4}{5} = 80\).

As you can see, if you are given a value, it is easy to find its percentile rank; going the other way is slightly harder.
One way to do this is to sort the scores and find the row number that corresponds to a percentile rank.
To find the row number, divide the total number of scores by 100, multiply that number by the desired percentile rank, and then *round up* to the nearest integer value.
The rounding up operation can be handled via the `ceiling()` function.
So, for our example, the value with percentile rank 55 is:

```r
percentile_rank_row_number <- ceiling(55 * number_of_tests / 100)

test_scores %>%
  arrange(score) %>%
  slice(percentile_rank_row_number)
```

<table class="table table-striped table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> score </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 77 </td>
  </tr>
</tbody>
</table>

The result of this calculation is called a **percentile**.
So this means that, in the distribution of exam scores, the 55th percentile corresponds to a score of 77.

In R, there is a function called `quantile()` that can do the above calculation automatically, although you need to take care with the inputs.
Let's first show what happens when we aren't careful.
We might think that we can calculate the 55th percentile by running:

```r
test_scores %>%
  pull(score) %>%
  quantile(probs = combine(0.55))
```

<table class="table table-striped table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> x </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 55% </td>
   <td style="text-align:right;"> 79.2 </td>
  </tr>
</tbody>
</table>

We get a score of 79.2, which isn't in our dataset.
This happens because `quantile()` interpolates between the scores by default.
Sometimes you will want this behavior, other times you will not.
When the dataset is this small, it doesn't make as much sense to permit interpolation, as it can be based on rather aggressive assumptions about what intermediate scores might look like.
To tell `quantile()` to compute scores in the same manner as we did above, add the input `type = 1`:

```r
test_scores %>%
  pull(score) %>%
  quantile(probs = combine(0.55), type = 1)
```

<table class="table table-striped table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> x </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 55% </td>
   <td style="text-align:right;"> 77 </td>
  </tr>
</tbody>
</table>

This, as expected, agrees with the manual calculation.

It is worth emphasizing that the difference between "percentile" and "percentile rank" can be confusing, and people do not always use the terms precisely.
To summarize, if we want to know the percentage of people obtained scores equal to or lower than ours, then we are computing a percentile rank.
If we start with a percentile, then we are computing the score in the distribution that corresponds with it.

### CDFs

Now that we understand percentiles and percentile ranks, we are ready to tackle the **cumulative distribution function** (CDF).
The CDF is the function that maps from a value to its percentile rank.
To find the CDF for any particular value in our distribution, we compute the fraction of values in the distribution less than or equal to our selected value.
Computing this is similar to how we calculated the percentile rank, except that the result is a probability in the range 0 -- 1 rather than a percentile rank in the range 0 -- 100.
For our test scores example, we can manually compute the CDF in the following way:


```r
test_scores_cdf <- test_scores %>%
  arrange(score) %>%
  mutate(cdf = row_number() / n())
```

<table class="table table-striped table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> score </th>
   <th style="text-align:right;"> cdf </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 55 </td>
   <td style="text-align:right;"> 0.2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:right;"> 0.4 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 77 </td>
   <td style="text-align:right;"> 0.6 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 88 </td>
   <td style="text-align:right;"> 0.8 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 99 </td>
   <td style="text-align:right;"> 1.0 </td>
  </tr>
</tbody>
</table>

The visualization of the CDF looks like:

<img src="distributions_files/figure-html/test-scores-cdf-plot-1.svg" width="100%" style="display: block; margin: auto;" />

As you can see, the CDF of a sample looks like a sequence of steps.
Appropriately enough, this is called a step function, and the CDF of *any* sample is a step function.

Also note that we can evaluate the CDF for any value, not just values that appear in the sample.
If we select a value that is less than the smallest value in the sample, then the CDF is 0.
If we select a value that is greater than the largest value, then the CDF is 1.

### Representing CDFs

While it's good to know how to manually compute the CDF, we can construct the CDF of a sample automatically using the `geom_step()` function if we include `stat = "ecdf"` as an additional input.
Let's use this to look at the CDF for the average work travel time for the full dataset:

```r
county_complete %>%
  ggplot() +
  geom_step(mapping = aes(x = mean_work_travel), stat = "ecdf") +
  labs(y = "CDF")
```

<img src="distributions_files/figure-html/mean-work-travel-cdf-visualization-1.svg" width="100%" style="display: block; margin: auto;" />

With this plot we can easily specify an average work travel time percentile and read the associated time from the plot and vice-versa.

### Comparing CDFs

CDFs are especially useful for comparing distributions.
Let's revisit the comparison we made between the average work travel times in Nebraska and Iowa.
Here is the full code that converts those distributions into CDFs:

```r
county_complete %>%
  filter(state == "Nebraska" | state == "Iowa") %>%
  ggplot() +
  geom_step(
    mapping = aes(x = mean_work_travel, color = state),
    stat = "ecdf"
  ) +
  labs(y = "CDF")
```

<img src="distributions_files/figure-html/compare-cdf-of-ne-ia-travel-times-plot-1.svg" width="100%" style="display: block; margin: auto;" />

This visualization makes the shapes of the distributions and the relative differences between them much clearer.
We see that Nebraska has shorter average work travel times for most of the distribution, at least until you reach an average time of 25 minutes, after which the Nebraska and Iowa distributions become similar to one another.

While it takes some time to get used to CDFs, it is worth the effort to do so as they show more information, more clearly, than PMFs.

## Credits

This chapter, "Representing distributions," is a derivative of "Chapter 3 Probability mass functions" and "Chapter 4 Cumulative distribution functions" in [Allen B. Downey, *Think Stats: Exploratory Data Analysis*, 2nd ed. (O'Reilly Media, Sebastopol, CA, 2014)][think-stats-2], used under [CC BY-NC-SA 4.0][cc-4-by-nc-sa].

[think-stats-2]: http://a.co/grOJGrv 
[cc-4-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
