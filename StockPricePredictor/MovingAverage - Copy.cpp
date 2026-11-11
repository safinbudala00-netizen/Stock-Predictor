#include "MovingAverage.h"
#include <stdexcept>

double MovingAverage::predict(
    const vector<double>& prices
) const {

    if (prices.empty())
        throw runtime_error("No price history available.");

    int count = prices.size() < 5
                ? static_cast<int>(prices.size())
                : 5;

    double sum = 0;

    for (int i = static_cast<int>(prices.size()) - count;
         i < static_cast<int>(prices.size()); i++) {

        sum += prices[i];
    }

    return sum / count;
}
