#ifndef MOVINGAVERAGE_H
#define MOVINGAVERAGE_H

#include "StockPredictor.h"

class MovingAverage : public StockPredictor {

public:
    double predict(
        const vector<double>& prices
    ) const override;
};

#endif
