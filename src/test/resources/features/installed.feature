Feature: List Candidate Versions

	A dummy template to be served back that has the following information:
	* Candidate: grails
	* Current: 2.1.0
	* Versions: 2.1.0,2.1.1,2.1.2 (CSV)

	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: No candidate specified
		Given I do not have a "grails" candidate installed
		And the candidate "grails" has a version list available
		And the system is bootstrapped
		When I enter "sdk installed"
		Then I see "No candidate provided."

	Scenario: List uninstalled candidate
		Given I do not have a "grails" candidate installed
		And the candidate "grails" has a version list available
		And the system is bootstrapped
		When I enter "sdk installed grails"
		Then I see "None installed!"

	Scenario: List installed candidate
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the candidate "grails" has a version list available
		And the system is bootstrapped
		When I enter "sdk installed grails"
		Then I see "2.1.0"
		And I do not see "2.1.1"

	Scenario: List installed multiple Versions
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the candidate "grails" version "2.1.1" is already installed but not default
		And the candidate "grails" has a version list available
		And the system is bootstrapped
		When I enter "sdk installed grails"
		Then I see "2.1.0"
		And I see "2.1.1"
