Feature: Wedge in whitespace in an enclosed river in the text
  I want to increase column separation

Background:
  Given I am in buffer "*wedge-ws*"
  And the buffer is empty

Scenario: Bounded simple increase
  When I insert:
    """
    moophlebistre
    cat dog
    foo bar
    mef gog
    cthulhu for president
    """
  And I place the cursor before "bar"
  And I press "C-c :"
  Then I should see:
    """
    moophlebistre
    cat  dog
    foo  bar
    mef  gog
    cthulhu for president
    """


Scenario: Increase snag
  When I insert:
    """
    moophlebistre
    cat dog
    foo bar
    mef gog
    boar blef
    """
  And I place the cursor before "bar"
  And I press "C-c :"
  And I press "C-c :"
  Then I should see:
    """
    moophlebistre
    cat   dog
    foo   bar
    mef   gog
    boar  blef
    """


Scenario: Increase vs tab
  When I insert:
    """
    moophlebistre
    mooblof gog
    sdvmd	<-tab
    xmkdcat dog
    xmefodo bar
    remmoboar blef
    """
  And I place the cursor before "bar"
  And I press "C-c :"
  Then I should see:
    """
    moophlebistre
    mooblof  gog
    sdvmd	<-tab
    xmkdcat  dog
    xmefodo  bar
    remmoboar blef
    """
