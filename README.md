cron-apt cookbook
------------------

[![Build Status](https://secure.travis-ci.org/gregpalmier/cronapt-cookbook.png)](http://travis-ci.org/gregpalmier/cronapt-cookbook)

This cookbook provides a basic cron-apt management.

Requirements
------------
* [vagrant](http://downloads.vagrantup.com/) >= 1.2.0
* [berkshelf](http://berkshelf.com/) >= 2.0.0
* [vagrant-berkshelf plugin](https://github.com/RiotGames/vagrant-berkshelf) >= 1.3.3

Usage
-----

In your Vagrantfile, customize these attributes:

````
    chef.json = {
        :cronapt => {
          :mailto => 'you@example.com',
          :enable_upgrade => true,
          :fivemin => true
      }
    }
````

Attributes
----------

````
default['cronapt']['mailto']           = 'your@email.com'
default['cronapt']['mailon']           = 'always'
default['cronapt']['enable_upgrade']   = false
default['cronapt']['nightly']          = false
default['cronapt']['hourly']           = false
default['cronapt']['fivemin']          = false
default['cronapt']['force_confmiss']   = false
default['cronapt']['force_confnew']    = false
default['cronapt']['force_confdef']    = false
default['cronapt']['force_confold']    = false
````

Recipes
-------

No additional recipes yet.

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
License: None.  Do as you wish.
Authors: gregpalmier
