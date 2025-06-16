cost = 2000;
prices = linspace(0.1, 20, 200);
profits = zeros(size(prices));

for i = 1:length(prices)
    price = prices(i);
    demand = 1000 - 50 * price;
    profits(i) = price * demand - cost;
end

[opt_profit, idx] = max(profits);
opt_price = prices(idx);
opt_demand = 1000 - 50 * opt_price;

fprintf('Optimalna cijena: %.2f KM\n', opt_price);
fprintf('Optimalna tražnja: %.2f jedinica\n', opt_demand);
fprintf('Maksimalni profit: %.2f KM\n', opt_profit);

figure;
plot(prices, profits, 'LineWidth', 2);
hold on;
plot(opt_price, opt_profit, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
xlabel('Cijena (KM)');
ylabel('Profit (KM)');
title('Profit u zavisnosti od cijene');
legend('Profit funkcija', 'Optimalna tačka');
grid on;
