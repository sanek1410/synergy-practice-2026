#include <iostream>
#include <string>

using namespace std;

class TourService
{
protected:
    string name;
    int price;

public:
    TourService(string n, int p)
    {
        name = n;
        price = p;
    }

    void showInfo()
    {
        cout << "Услуга: " << name << endl;
        cout << "Цена: " << calculatePrice() << " руб." << endl;
    }

    int calculatePrice()
    {
        return price;
    }
};

class BusTour : public TourService
{
private:
    int distance;

public:
    BusTour(string n, int p, int d) : TourService(n, p)
    {
        distance = d;
    }

    int calculatePrice()
    {
        return price + distance * 12;
    }

    void showBusInfo()
    {
        cout << "Автобусный тур: " << name << endl;
        cout << "Итоговая цена: " << calculatePrice() << " руб." << endl;
    }
};

int main()
{
    TourService service("Экскурсия", 1500);
    BusTour tour("Золотое кольцо", 5000, 320);

    service.showInfo();
    cout << endl;
    tour.showInfo();
    tour.showBusInfo();

    return 0;
}
