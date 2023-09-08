@extratask
Feature: Convert data

  Scenario: Convert data from json and ## file into original one
    * def jsonFile = read('classpath:data/data.json')
    * def txtText = read('classpath:data/data.txt')

    * def func =
    """
      function(text){
        let newText = text.replace(/##/g, "><");
        let len = newText.length()
        for (let i = 0; i < len; i++) {
          if (i == 0) {
            newText = newText.substring(0,i+7) + newText.substring(i+8, len);
          }
          if (newText[i+1] == '\n' || i == len - 1) {
            newText = newText.substring(0, i) + ">" + newText.substring(i+1, len);
          }
          if (newText[i] == '\n') {
            newText = newText.substring(0,i+8) + newText.substring(i+9, len);
          }
        }

        return newText
      }
    """
    * def newText = call func txtText
    * def replacement = Java.type('helpers.TextProcessing')
    * replace newText
      | token                         | value                                                           |
      | account_number_6              | replacement.addSpace(jsonFile.account_number_6,6)               |
      | account_suffix_3              | replacement.addSpace(jsonFile.account_suffix_3, 3)              |
      | billing_id_15                 | replacement.addSpace(jsonFile.billing_id_15, 15)                |
      | quoteback_60                  | replacement.addSpace(jsonFile.quoteback_60, 60)                 |
      | report_code_4                 | replacement.addSpace(jsonFile.report_code_4, 4)                 |
      | report_type_1                 | replacement.addSpace(jsonFile.report_type_1, 1)                 |
      | filler_6                      | replacement.addSpace(jsonFile.filler_6, 6)                      |
      | report_usage_2                | replacement.addSpace(jsonFile.report_usage_2, 2)                |
      | requested_handling_location_7 | replacement.addSpace(jsonFile.requested_handling_location_7, 7) |
      | product_line_1                | replacement.addSpace(jsonFile.product_line_1, 1)                |
      | channel_id_1                  | replacement.addSpace(jsonFile.channel_id_1, 1)                  |
      | record_version_2              | replacement.addSpace(jsonFile.record_version_2, 2)              |
      | date_of_order_8               | replacement.addSpace(jsonFile.date_of_order_8, 8)               |
      | product_requested_10          | replacement.addSpace(jsonFile.product_requested_10, 10)         |
      | filler_14                     | replacement.addSpace(jsonFile.filler_14, 14)                    |
      | reserved_for_internal_user_3  | replacement.addSpace(jsonFile.reserved_for_internal_user_3, 3)  |
      | classification_PI_2           | replacement.addSpace(jsonFile.classification_PI_2, 2)           |
      | name_prefix_4                 | replacement.addSpace(jsonFile.name_prefix_4, 4)                 |
      | name_last_28                  | replacement.addSpace(jsonFile.name_last_28, 28)                 |
      | name_first_20                 | replacement.addSpace(jsonFile.name_first_20, 20)                |
      | name_middle_15                | replacement.addSpace(jsonFile.name_middle_15, 15)               |
      | name_suffix_3                 | replacement.addSpace(jsonFile.name_suffix_3, 3)                 |
      | date_of_birth_8               | replacement.addSpace(jsonFile.date_of_birth_8, 8)               |
      | age_3                         | replacement.addSpace(jsonFile.age_3, 3)                         |
      | sex_1                         | replacement.addSpace(jsonFile.sex_1, 1)                         |
      | security_num_9                | replacement.addSpace(jsonFile.security_num_9, 9)                |
      | height_feet_1                 | replacement.addSpace(jsonFile.height_feet_1, 1)                 |
      | height_inches_2               | replacement.addSpace(jsonFile.height_inches_2, 2)               |
      | weight_3                      | replacement.addSpace(jsonFile.weight_3, 3)                      |
      | martial_status_1              | replacement.addSpace(jsonFile.martial_status_1, 1)              |
      | eye_color_3                   | replacement.addSpace(jsonFile.eye_color_3, 3)                   |
      | hair_color_3                  | replacement.addSpace(jsonFile.hair_color_3, 3)                  |
      | race_code_1                   | replacement.addSpace(jsonFile.race_code_1, 1)                   |
      | filler_36                     | replacement.addSpace(jsonFile.filler_36, 36)                    |
      | classification_AL_2           | replacement.addSpace(jsonFile.classification_AL_2, 2)           |
      | group_usage_indicator_1       | replacement.addSpace(jsonFile.group_usage_indicator_1, 1)       |
      | house_number_9                | replacement.addSpace(jsonFile.house_number_9, 9)                |
      | street_name_20                | replacement.addSpace(jsonFile.street_name_20, 20)               |
      | apartment_num_5               | replacement.addSpace(jsonFile.apartment_num_5, 5)               |
      | city_20                       | replacement.addSpace(jsonFile.city_20, 20)                      |
      | state_2                       | replacement.addSpace(jsonFile.state_2, 2)                       |
      | zip_code_5                    | replacement.addSpace(jsonFile.zip_code_5, 5)                    |
      | zip_code4_4                   | replacement.addSpace(jsonFile.zip_code4_4, 4)                   |
      | time_years_2                  | replacement.addSpace(jsonFile.time_years_2, 2)                  |
      | time_mths_2                   | replacement.addSpace(jsonFile.time_mths_2, 2)                   |
      | date_first_8                  | replacement.addSpace(jsonFile.date_first_8, 8)                  |
      | date_last_8                   | replacement.addSpace(jsonFile.date_last_8, 8)                   |
      | country_15                    | replacement.addSpace(jsonFile.country_15, 15)                   |
      | census_tract_10               | replacement.addSpace(jsonFile.census_tract_10, 10)              |
      | filler_30                     | replacement.addSpace(jsonFile.filler_30, 30)                    |
    * def fileWriter = Java.type('helpers.FileCreator')
    * eval fileWriter.CreateTxtFile('src/test/java/data/originalData.txt', newText)