#ifndef PORTFOLIO_H
#define PORTFOLIO_H

#include <string>
#include <vector>

using namespace std;

struct Holding {
    string symbol;
    int quantity;
    double buyPrice;
};

class Portfolio {

private:
    vector<Holding> holdings;
    string filename;

    void save() const;

public:
    explicit Portfolio(string file = "portfolio.csv");

    void load();

    void add(const string& symbol,
             int quantity,
             double buyPrice);

    void remove(const string& symbol);

    void display() const;
};

#endif
