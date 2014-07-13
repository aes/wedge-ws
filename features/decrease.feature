# Hint: narrow-to-page

Feature: Wedge in whitespace in an enclosed river in the text
  I want to increase column separation

Background:
  Given I am in buffer "*wedge-ws*"
  And the buffer is empty

Scenario: Simple decrease
  When I insert:
    """

    moophlebistre
    cat  dog
    foo  bar
    mef  gog
    cthulhu for president
    """
  And I place the cursor before "bar"
  And I press "C-c ;"
  Then I should see:
    """

    moophlebistre
    cat dog
    foo bar
    mef gog
    cthulhu for president
    """

Scenario: Break tabs as decrease
  When I insert:
    """

    moophlebistre
    cat	dog
    foo	bar
    mef	gog
    cthulhu for president
    """
  And I place the cursor before "bar"
  And I press "C-c ;"
  Then I should see:
    """

    moophlebistre
    cat    dog
    foo    bar
    mef    gog
    cthulhu for president
    """

Scenario: Refuse to collaspe when decreasing
  When I insert:
    """

    moophlebistre
    cat  dog
    foo  bar
    mef gog
    cthulhu for president
    """
  And I place the cursor before "bar"
  And I press "C-c ;"
  Then I should see:
    """

    moophlebistre
    cat dog
    foo bar
    mef gog
    cthulhu for president
    """

Scenario: Refuse drive-by collaspe when decreasing (lower)
  When I insert:
    """

    moophlebistre
    cat     dog
    foo     bar
    mef     gog
    cthulhu for president
    """
  And I place the cursor before "bar"
  And I press "C-c ;"
  Then I should see:
    """

    moophlebistre
    cat    dog
    foo    bar
    mef    gog
    cthulhu for president
    """

Scenario: Refuse drive-by collaspe when decreasing (upper)
  When I insert:
    """

    cthulhu for president
    cat     dog
    foo     bar
    mef     gog
    moophlebistre
    """
  And I place the cursor before "bar"
  And I press "C-c ;"
  Then I should see:
    """

    cthulhu for president
    cat    dog
    foo    bar
    mef    gog
    moophlebistre
    """

Scenario: Decrease should arrow into pockets
  When I insert:
    """

    cthulhu for president
    cat     dog
    foo     bar
    mef     gog
    cthulhu for president
    """
  And I place the cursor before "bar"
  And I press "C-c ;"
  Then I should see precisely:
    """

    cthulhu for president
    cat    dog
    foo    bar
    mef    gog
    cthulhu for president
    """
