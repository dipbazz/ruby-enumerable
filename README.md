![](https://img.shields.io/badge/Microverse-blueviolet)

# Custom Enumerable methods

## Definition

In Ruby Enumerable are a set of convinent built-in methods that works as a loop with added functionality which make it much more convenient to use instead of different types of loops.

Below is an simple example to demostrate how enumerable methods are convenient over loops.

```
friends = ['Alice', 'Bob', 'Mary', 'Harry']

# let us say Hello to our every friend using for loop
for friend in friends
  puts "Hello, #{friend}"
end

# Now let us achieve same thing with enumerable method #each
friends.each { |friend| puts "Hello, #{friend} }
```

## About the Project

In this project we have implemented some [Enumerable](https://ruby-doc.org/core-2.7.2/Enumerable.html) methods by our selves. Custom Enumerable method that we created has prefix `my_` and after that actual enumerable name. So, the `#map` enumerable translate to `#my_map` method in our code. Different enumerable method that we implemented are: `#my_each`, `#my_each_with_index`, `#my_select`, `#my_all?`, `#my_any?`, `#my_none?`, `#my_count`, `#my_map`, and  `#my_inject`.

## Built With

- Ruby

## Live Demo

[Live Demo Link](https://repl.it/@dipbazz/ruby-enumerable#enumerable.rb)


## Getting Started

**Just clone this repo and and navigate to the folder.**


**To get a local copy up and running follow these simple example steps.**

   - Clone this repo.
   - Navigate to the ruby-enumerable folder
   - In your terminal run `ruby enumerable.rb`
   - You are successful to get a local copy up and running.

**To test the code with rspec.**
  - install rspec using `gem install rspec` 
  - run `rspec` or `rspec --format doc` on your terminal to test the code .
  


## Authors

👤 **Dipesh Bajgain**

- GitHub: [@dipbazz](https://github.com/dipbazz)
- Twitter: [@dipbazz](https://twitter.com/dipbazz)
- LinkedIn: [Dipesh Bajgain](https://www.linkedin.com/in/dipbazz/)

👤 **Silas Kalu**

- GitHub: [@cyonii](https://github.com/cyonii)
- Twitter: [@theOnuoha](https://twitter.com/theOnuoha)
- LinkedIn: [Silas Kalu](https://www.linkedin.com/in/silas-kalu-2a9a13199/)

👤 **Divyesh Patel**

- GitHub: [@Div685](https://github.com/Div685)
- Twitter: [@div_685](https://twitter.com/div_685)
- LinkedIn: [Divyesh Patel](https://www.linkedin.com/in/divyesh-patel-2a15a6107)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./LICENSE) licensed.
