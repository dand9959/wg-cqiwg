<?xml version="1.0" encoding="UTF-8"?>
<!--
HL7 QRDA III Release 1
Version 1.0 

    THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
    THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
    IN NO EVENT SHALL ESAC INC., OR ANY OF THEIR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
    GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

    IMPLEMENTATION GUIDE CONFORMANCE STATEMENTS and SCHEMATRON ASSERTIONS:

    In general, conformance statements are of three main types:

        - SHALL statements imply the conformance adherence is required. 
          SHALL Schematron assertions, when triggered, are considered 'errors'.

        - SHOULD statements imply the conformance adherence is recommended, but not required. 
          SHOULD Schematron assertions, when triggered, are considered 'warnings'.
          Note about SHOULD Schematron assertions:
          When a SHOULD conformance statement has cardinality of "zero or one [0..1]", then the corresponding Schematron assertion will only test for
          the presence of the item (i.e. "count(item) = 1"). If it tested for 0 as well, then the assertion would never trigger because the item is either present
          (count=1) or it is not (count=0), both of which would be acceptable. By only checking for the item's presence (count=1), Schematron can issue a
          warning if the item is absent. Similar logic applies for SHOULD conformance statements with cardinality of "zero or more [0..*]" and the Schematron
          assertion checks for at least one of the item (i.e. "count(item) > 0").             

        - MAY statements imply the conformance adherence is truly optional.
          MAY conformance statements are not enforced in the Schematron.

    Each type of conformance statement has three possible flavors:

        - Simple statements are simply the conformance statement with no further qualifications.
          For example: "SHALL contain exactly one [1..1] id."

        - Compound statements have additional requirements, represented by one or more "such that" conformance sub-clauses presented beneath the main conformance statement. 
          These are also referred to as "such that" statements.
          For example: "SHALL contain exactly one[1..] id such that 
                           1) SHALL contain exactly one [1..1] root, 
                           2) SHALL contain exactly one [1..1] extension."

          Compound statements are implemented in a single Schematron assertion that includes testing for the main conformance and any "such that" sub-clauses.
          In rare instances, a compound conformance statement sub-clause may itself contain "such that" sub-clauses. In that event, the corresponding single 
          Schematron assertion also includes testing for the "sub-sub-clauses".
          In the cases where one or more of a compound conformance sub-clauses have simple conformance statements under them, those are enforced as separate Schematron assertions.

        - Guidance conformance statements are those that represent conformance requirements that cannot or need not be implemented in Schematron assertions. 
          For example: "If patient name was not provided at time of admission, then a value of UNK SHALL be used."
          Guidance conformance statements of any type (SHALL, SHOULD, MAY) are not enforced in the Schematron.

    Examples:

    A) SHALL contain exactly one [1..1] id
        1) This id SHALL contain exactly one [1..1] @root
        2) This id SHALL contain exactly one [1..1] @extension
            i) This id SHALL contain exactly one [1..1] source such that
                a) SHALL contain exactly one [1..1] @value

    For the above example, the Schematron will have 4 assertions: One for A and one each for A.1, A.2 and A.2.i 
    (where A.2.i is a compound conformance that includes the "such that" A.2.i.a sub-clause in its test.)	


    B) SHALL contain exactly one [1..1] id such that
        1) SHALL contain exactly one [1..1] @root
        2) SHALL contain exactly one [1..1] @extension
        3) SHALL contain exactly one [1..1] source  
            i) SHALL contain exactly one [1..1] @value

    For the above example, the Schematron will have 2 assertions: One for B (where B is a compound conformance that includes "such that" sub-clauses B.1, B.2, and B.3), 
    and one for B.3.i since it is NOT a such-that clause for B.3.

    C) MAY contain exactly one [1..1] id such that
        1) SHALL contain exactly one [1..1] @root
        2) SHALL contain exactly one [1..1] @extension
        3) SHALL contain exactly one [1..1] source  
            i) If present, source SHALL contain exactly one [1..1] @value

    For the above example, the Schematron will have 1 assertion for C.3.i.  C is a MAY "such that" compound conformance statement and the Schematron does not implement any MAY conformances.
    However, C.3.i is not a "such that" sub-clause. It merits its own Schematron assertion because if an id/source exists (along with
    id/@root and id/@extension), then it SHALL contain a @value.

    This schematron supports the HL7 QRDA III Release 1 (Normative) IG 

Wed Dec 09 15:04:15 MST 2020
-->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:voc="http://www.lantanagroup.com/voc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
  <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
  <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
  <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
  <sch:phase id="errors">
    <sch:active pattern="Aggregate_count-pattern-errors" />
    <sch:active pattern="Continuous_variable_measure_value-pattern-errors" />
    <sch:active pattern="Ethnicity_supp_data_element-pattern-extension-check" />
    <sch:active pattern="Ethnicity_supp_data_element-pattern-errors" />
    <sch:active pattern="Improvement_Activity_Performed_Reference_and_Result-pattern-errors" />
    <sch:active pattern="Improvement_Activity-pattern-extension-check" />
    <sch:active pattern="Improvement_Activity-pattern-errors" />
    <sch:active pattern="Measure_data-pattern-extension-check" />
    <sch:active pattern="Measure_data-pattern-errors" />
    <sch:active pattern="Measure_Performed-pattern-errors" />
    <sch:active pattern="Measure_Reference-pattern-errors" />
    <sch:active pattern="Measure_Reference_and_Results-pattern-extension-check" />
    <sch:active pattern="Measure_Reference_and_Results-pattern-errors" />
    <sch:active pattern="Payer_Supplemental_Data_Element-pattern-extension-check" />
    <sch:active pattern="Payer_Supplemental_Data_Element-pattern-errors" />
    <sch:active pattern="Performance_Rate-pattern-extension-check" />
    <sch:active pattern="Performance_Rate-pattern-errors" />
    <sch:active pattern="Performance_Rate_for_Proportion_Measure-pattern-extension-check" />
    <sch:active pattern="Performance_Rate_for_Proportion_Measure-pattern-errors" />
    <sch:active pattern="Postal_Code_Supplemental_Data_Element_V2-pattern-extension-check" />
    <sch:active pattern="Postal_Code_Supplemental_Data_Element_V2-pattern-errors" />
    <sch:active pattern="Promoting_Interoperability_Measure_Performed_Reference_and_Result-pattern-errors" />
    <sch:active pattern="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Denominator-pattern-errors" />
    <sch:active pattern="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Numerator-pattern-errors" />
    <sch:active pattern="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results-pattern-errors" />
    <sch:active pattern="Promoting_Interoperability-pattern-extension-check" />
    <sch:active pattern="Promoting_Interoperability-pattern-errors" />
    <sch:active pattern="QRDA_Category_III_Measure-pattern-extension-check" />
    <sch:active pattern="QRDA_Category_III_Measure-pattern-errors" />
    <sch:active pattern="QRDA_Category_III_Report-pattern-extension-check" />
    <sch:active pattern="QRDA_Category_III_Report-pattern-errors" />
    <sch:active pattern="Race_Supplemental_Data_Element-pattern-extension-check" />
    <sch:active pattern="Race_Supplemental_Data_Element-pattern-errors" />
    <sch:active pattern="Reporting_Rate_for_Proportion_Measure-pattern-errors" />
    <sch:active pattern="Reporting_Stratum-pattern-errors" />
    <sch:active pattern="Sex_Supplemental_Data_Element-pattern-extension-check" />
    <sch:active pattern="Sex_Supplemental_Data_Element-pattern-errors" />
    <sch:active pattern="Measure-section-pattern-errors" />
    <sch:active pattern="Reporting-Parameters-Act-pattern-extension-check" />
    <sch:active pattern="Reporting-Parameters-Act-pattern-errors" />
  </sch:phase>
  <sch:phase id="warnings">
    <sch:active pattern="Improvement_Activity_Performed_Reference_and_Result-pattern-warnings" />
    <sch:active pattern="Measure_Reference-pattern-warnings" />
    <sch:active pattern="Measure_Reference_and_Results-pattern-warnings" />
    <sch:active pattern="Promoting_Interoperability_Measure_Performed_Reference_and_Result-pattern-warnings" />
    <sch:active pattern="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results-pattern-warnings" />
    <sch:active pattern="QRDA_Category_III_Report-pattern-warnings" />
    <sch:active pattern="Reporting_Stratum-pattern-warnings" />
  </sch:phase>
  <!--
      ERROR Patterns and Assertions
  -->
  <sch:pattern id="Aggregate_count-pattern-errors">
    <sch:rule id="Aggregate_count-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]">
      <sch:assert id="a-77-17563-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17563).</sch:assert>
      <sch:assert id="a-77-17564-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17564).</sch:assert>
      <sch:assert id="a-77-17565-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:77-17565) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.3" (CONF:77-18095).</sch:assert>
      <sch:assert id="a-77-17566-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17566).</sch:assert>
      <sch:assert id="a-77-17567-error" test="count(cda:value[@xsi:type='INT'])=1">SHALL contain exactly one [1..1] value with @xsi:type="INT" (CONF:77-17567).</sch:assert>
      <sch:assert id="a-77-19509-error" test="count(cda:methodCode)=1">SHALL contain exactly one [1..1] methodCode (CONF:77-19509).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:code">
      <sch:assert id="a-77-19508-error" test="@code='MSRAGG'">This code SHALL contain exactly one [1..1] @code="MSRAGG" rate aggregation (CONF:77-19508).</sch:assert>
      <sch:assert id="a-77-21160-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:77-21160).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:value[@xsi:type='INT']">
      <sch:assert id="a-77-17568-error" test="@value">This value SHALL contain exactly one [1..1] @value (CONF:77-17568).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-methodCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:methodCode">
      <sch:assert id="a-77-19510-error" test="@code='COUNT'">This methodCode SHALL contain exactly one [1..1] @code="COUNT" Count (CONF:77-19510).</sch:assert>
      <sch:assert id="a-77-21161-error" test="@codeSystem='2.16.840.1.113883.5.84'">This methodCode SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.84" (CodeSystem: ObservationMethod urn:oid:2.16.840.1.113883.5.84) (CONF:77-21161).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:referenceRange">
      <sch:assert id="a-77-18393-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18393).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-77-18394-error" test="count(cda:value[@xsi:type='INT'])=1">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="INT" (CONF:77-18394).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Continuous_variable_measure_value-pattern-errors">
    <sch:rule id="Continuous_variable_measure_value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]">
      <sch:assert id="a-77-17569-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17569).</sch:assert>
      <sch:assert id="a-77-17570-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17570).</sch:assert>
      <sch:assert id="a-77-18096-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18096) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.2" (CONF:77-18097).</sch:assert>
      <sch:assert id="a-77-17571-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17571).</sch:assert>
      <sch:assert id="a-77-17572-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:77-17572).</sch:assert>
      <sch:assert id="a-77-18242-error" test="count(cda:methodCode)=1">SHALL contain exactly one [1..1] methodCode, which SHALL be selected from ValueSet ObservationMethodAggregate urn:oid:2.16.840.1.113883.1.11.20450 DYNAMIC (CONF:77-18242).</sch:assert>
      <sch:assert id="a-77-18243-error" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:77-18243).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:reference">
      <sch:assert id="a-77-18244-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:77-18244).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:reference/cda:externalObservation">
      <sch:assert id="a-77-18245-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:77-18245).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:referenceRange">
      <sch:assert id="a-77-18390-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18390).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-77-18391-error" test="count(cda:value)=1">This observationRange SHALL contain exactly one [1..1] value (CONF:77-18391).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Ethnicity_supp_data_element-pattern-extension-check">
    <sch:rule id="Ethnicity_supp_data_element-extension-check" context="cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7']">
      <sch:assert id="a-3259-18218-extension-error" test="@extension='2016-09-01'">SHALL contain exactly one [1..1] templateId (CONF:3259-18218) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.7" (CONF:3259-18219). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21176).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Ethnicity_supp_data_element-pattern-errors">
    <sch:rule id="Ethnicity_supp_data_element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7'][@extension='2016-09-01']]">
      <sch:assert id="a-3259-18216-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-18216).</sch:assert>
      <sch:assert id="a-3259-18217-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-18217).</sch:assert>
      <sch:assert id="a-3259-18218-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-18218) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.7" (CONF:3259-18219). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21176).</sch:assert>
      <sch:assert id="a-3259-18220-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-18220).</sch:assert>
      <sch:assert id="a-3259-18118-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3259-18118).</sch:assert>
      <sch:assert id="a-3259-18222-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Ethnicity urn:oid:2.16.840.1.114222.4.11.837 DYNAMIC (CONF:3259-18222).</sch:assert>
      <sch:assert id="a-3259-18120-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3259-18120) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:3259-18121). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3259-18122). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:3259-18123).</sch:assert>
    </sch:rule>
    <sch:rule id="Ethnicity_supp_data_element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7'][@extension='2016-09-01']]/cda:code">
      <sch:assert id="a-3259-18221-error" test="@code='69490-1'">This code SHALL contain exactly one [1..1] @code="69490-1" Ethnic (CONF:3259-18221).</sch:assert>
      <sch:assert id="a-3259-21443-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3259-21443).</sch:assert>
    </sch:rule>
    <sch:rule id="Ethnicity_supp_data_element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7'][@extension='2016-09-01']]/cda:statusCode">
      <sch:assert id="a-3259-18119-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:3259-18119).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Improvement_Activity_Performed_Reference_and_Result-pattern-errors">
    <sch:rule id="Improvement_Activity_Performed_Reference_and_Result-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.33'][@extension='2016-09-01']]">
      <sch:assert id="a-3259-21434-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-21434).</sch:assert>
      <sch:assert id="a-3259-21435-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-21435).</sch:assert>
      <sch:assert id="a-3259-21425-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.33'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-21425) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.33" (CONF:3259-21432). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21433).</sch:assert>
      <sch:assert id="a-3259-21422-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument[@classCode='DOC'][count(cda:id[@root='2.16.840.1.113883.3.7034'][@extension])=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:3259-21422) such that it SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:3259-21431). SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-21423). This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3259-21430). This externalDocument SHALL contain exactly one [1..1] id (CONF:3259-21424) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.7034" (CONF:3259-21427). SHALL contain exactly one [1..1] @extension (CONF:3259-21428).</sch:assert>
      <sch:assert id="a-3259-21421-error" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.27'][@extension='2016-09-01']])=1])=1">SHALL contain exactly one [1..1] component (CONF:3259-21421) such that it SHALL contain exactly one [1..1] Measure Performed (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.27:2016-09-01) (CONF:3259-21426).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Improvement_Activity-pattern-extension-check">
    <sch:rule id="Improvement_Activity-extension-check" context="cda:section/cda:templateId[@root='2.16.840.1.113883.10.20.27.2.4']">
      <sch:assert id="a-4484-21175-extension-error" test="@extension='2020-12-01'">SHALL contain exactly one [1..1] templateId (CONF:4484-21175) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.4" (CONF:4484-21177). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-21398).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Improvement_Activity-pattern-errors">
    <sch:rule id="Improvement_Activity-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.4'][@extension='2020-12-01']]">
      <sch:assert id="a-4484-21175-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.4'][@extension='2020-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4484-21175) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.4" (CONF:4484-21177). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-21398).</sch:assert>
      <sch:assert id="a-4484-21181-error" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.33'][@extension='2016-09-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:4484-21181) such that it SHALL contain exactly one [1..1] Improvement Activity Performed Measure Reference and Results (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.33:2016-09-01) (CONF:4484-21436).</sch:assert>
      <!-- 11-25-2020 Updated templateID extension -->
      <sch:assert id="a-4484-26558-error" test="count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'][@extension='2020-12-01']]])=1">SHALL contain exactly one [1..1] entry (CONF:4484-26558) such that it SHALL contain exactly one [1..1] Reporting Parameters Act (V2) (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8:2020-12-01) (CONF:4484-26559).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_data-pattern-extension-check">
    <sch:rule id="Measure_data-extension-check" context="cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']">
      <sch:assert id="a-3259-17912-extension-error" test="@extension='2016-09-01'">SHALL contain exactly one [1..1] templateId (CONF:3259-17912) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.5" (CONF:3259-17913). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21161).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_data-pattern-errors">
    <sch:rule id="Measure_data-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-09-01']]">
      <sch:assert id="a-3259-17615-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-17615).</sch:assert>
      <sch:assert id="a-3259-17616-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-17616).</sch:assert>
      <sch:assert id="a-3259-17912-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-17912) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.5" (CONF:3259-17913). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21161).</sch:assert>
      <sch:assert id="a-3259-17617-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-17617).</sch:assert>
      <sch:assert id="a-3259-18199-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:3259-18199).</sch:assert>
      <sch:assert id="a-3259-17618-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3259-17618).</sch:assert>
      <sch:assert id="a-3259-17619-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3259-17619) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:3259-17910). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3259-17911). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:3259-17620).</sch:assert>
      <sch:assert id="a-3259-18239-error" test="count(cda:reference[count(cda:externalObservation[count(cda:id)=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:3259-18239) such that it SHALL contain exactly one [1..1] externalObservation (CONF:3259-18240). This externalObservation SHALL contain exactly one [1..1] id (CONF:3259-18241).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_data-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-09-01']]/cda:code">
      <sch:assert id="a-3259-18198-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3259-18198).</sch:assert>
      <sch:assert id="a-3259-21164-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3259-21164).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_data-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-09-01']]/cda:statusCode">
      <sch:assert id="a-3259-19555-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3259-19555).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_data-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-09-01']]/cda:value[@xsi:type='CD']">
      <sch:assert id="a-3259-21162-error" test="@code">This value SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet PopulationInclusionObservationType urn:oid:2.16.840.1.113883.1.11.20476 DYNAMIC (CONF:3259-21162).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Performed-pattern-errors">
    <sch:rule id="Measure_Performed-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.27'][@extension='2016-09-01']]">
      <sch:assert id="a-3259-21221-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-21221).</sch:assert>
      <sch:assert id="a-3259-21222-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-21222).</sch:assert>
      <sch:assert id="a-3259-21185-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.27'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-21185) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.27" (CONF:3259-21203). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21399).</sch:assert>
      <sch:assert id="a-3259-21382-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-21382).</sch:assert>
      <sch:assert id="a-3259-21440-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3259-21440).</sch:assert>
      <sch:assert id="a-3259-21391-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Yes No Indicator (HL7) urn:oid:2.16.840.1.114222.4.11.819 DYNAMIC (CONF:3259-21391).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Performed-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.27'][@extension='2016-09-01']]/cda:code">
      <sch:assert id="a-3259-21392-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3259-21392).</sch:assert>
      <sch:assert id="a-3259-21393-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3259-21393).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Performed-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.27'][@extension='2016-09-01']]/cda:statusCode">
      <sch:assert id="a-3259-21442-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CONF:3259-21442).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference-pattern-errors">
    <sch:rule id="Measure_Reference-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]">
      <sch:assert id="a-67-12979-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-12979).</sch:assert>
      <sch:assert id="a-67-12980-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-12980).</sch:assert>
      <sch:assert id="a-67-19532-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:67-19532) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.98" (CONF:67-19533).</sch:assert>
      <sch:assert id="a-67-26992-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:67-26992).</sch:assert>
      <sch:assert id="a-67-12981-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:67-12981).</sch:assert>
      <sch:assert id="a-67-12982-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument[@classCode='DOC'] [count(cda:id[@root])&gt;=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:67-12982) such that it SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:67-12983). SHALL contain exactly one [1..1] externalDocument (CONF:67-12984). This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:67-19534). This externalDocument SHALL contain at least one [1..*] id (CONF:67-12985) such that it  SHALL contain exactly one [1..1] @root (CONF:67-12986)</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Reference-statusCode-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:statusCode">
      <sch:assert id="a-67-27020-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:67-27020).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference_and_Results-pattern-extension-check">
    <sch:rule id="Measure_Reference_and_Results-extension-check" context="cda:organizer/cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']">
      <sch:assert id="a-4484-17908-extension-error" test="@extension='2020-12-01'">SHALL contain exactly one [1..1] templateId (CONF:4484-17908) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.1" (CONF:4484-17909). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-21170).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference_and_Results-pattern-errors">
    <sch:rule id="Measure_Reference_and_Results-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2020-12-01']]">
      <sch:assert id="a-4484-17887-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4484-17887).</sch:assert>
      <sch:assert id="a-4484-17888-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4484-17888).</sch:assert>
      <sch:assert id="a-4484-17908-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2020-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4484-17908) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.1" (CONF:4484-17909). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-21170).</sch:assert>
      <sch:assert id="a-4484-17890-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument)=1])=1">SHALL contain exactly one [1..1] reference (CONF:4484-17890) such that it SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:4484-17891). SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4484-17892).</sch:assert>
      <sch:assert id="a-4484-18425-error" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-09-01']])=1]) &gt; 0">SHALL contain at least one [1..*] component (CONF:4484-18425) such that it SHALL contain exactly one [1..1] Measure Data (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.5:2016-09-01) (CONF:4484-18426).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Reference_and_Results-reference-externalDocument-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2020-12-01']]/cda:reference[@typeCode='REFR']/cda:externalDocument">
      <sch:assert id="a-4484-19548-error" test="@classCode='DOC'">This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4484-19548).</sch:assert>
      <sch:assert id="a-4484-18192-error" test="count(cda:id[@root='2.16.840.1.113883.4.738'][@extension])=1">This externalDocument SHALL contain exactly one [1..1] id (CONF:4484-18192) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.738" (CONF:4484-18193).  SHALL contain exactly one [1..1] @extension (CONF:4484-21169).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Reference_and_Results-reference-externalDocument-code-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2020-12-01']]/cda:reference/cda:externalDocument/cda:code">
      <sch:assert id="a-4484-19553-error" test="@code='57024-2'">The code, if present, SHALL contain exactly one [1..1] @code="57024-2" Health Quality Measure Document (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4484-19553).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Reference_and_Results-reference-externalObservation-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2020-12-01']]/cda:reference/cda:externalObservation">
      <sch:assert id="a-4484-18355-error" test="count(cda:id) &gt; 0">This externalObservation SHALL contain at least one [1..*] id (CONF:4484-18355).</sch:assert>
      <sch:assert id="a-4484-18357-error" test="count(cda:code)=1">This externalObservation SHALL contain exactly one [1..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:4484-18357).</sch:assert>
      <sch:assert id="a-4484-18358-error" test="count(cda:text)=1">This externalObservation SHALL contain exactly one [1..1] text (CONF:4484-18358).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Reference_and_Results-reference-externalObservation-code-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2020-12-01']]/cda:reference/cda:externalObservation/cda:code">
      <sch:assert id="a-4484-19554-error" test="@code='55185-3'">This code SHALL contain exactly one [1..1] @code="55185-3" measure set (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4484-19554).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Payer_Supplemental_Data_Element-pattern-extension-check">
    <sch:rule id="Payer_Supplemental_Data_Element-extension-check" context="cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9']">
      <sch:assert id="a-2226-18237-extension-error" test="@extension='2016-02-01'">SHALL contain exactly one [1..1] templateId (CONF:2226-18237) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.9" (CONF:2226-18238). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21157).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Payer_Supplemental_Data_Element-pattern-errors">
    <sch:rule id="Payer_Supplemental_Data_Element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9'][@extension='2016-02-01']]">
      <sch:assert id="a-2226-21155-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-21155).</sch:assert>
      <sch:assert id="a-2226-21156-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-21156).</sch:assert>
      <sch:assert id="a-2226-18237-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-18237) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.9" (CONF:2226-18238). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21157).</sch:assert>
      <sch:assert id="a-2226-21158-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2226-21158).</sch:assert>
      <sch:assert id="a-2226-18106-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2226-18106).</sch:assert>
      <sch:assert id="a-2226-18250-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHOULD be selected from ValueSet Payer urn:oid:2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:2226-18250).</sch:assert>
      <sch:assert id="a-2226-18108-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2226-18108) such that it SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:2226-18111). SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2226-18109). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2226-18110).</sch:assert>
    </sch:rule>
    <sch:rule id="Payer_Supplemental_Data_Element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9'][@extension='2016-02-01']]/cda:code">
      <sch:assert id="a-2226-21159-error" test="@code='48768-6'">This code SHALL contain exactly one [1..1] @code="48768-6" Payment source  (CONF:2226-21159).</sch:assert>
      <sch:assert id="a-2226-21165-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-21165).</sch:assert>
    </sch:rule>
    <sch:rule id="Payer_Supplemental_Data_Element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9'][@extension='2016-02-01']]/cda:statusCode">
      <sch:assert id="a-2226-18107-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2226-18107).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Performance_Rate-pattern-extension-check">
    <sch:rule id="Performance_Rate-extension-check" context="cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.27.3.30']">
      <sch:assert id="a-3259-21298-extension-error" test="@extension='2016-09-01'">SHALL contain exactly one [1..1] templateId (CONF:3259-21298) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.30" (CONF:3259-21310). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21441).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Performance_Rate-pattern-errors">
    <sch:rule id="Performance_Rate-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.30'][@extension='2016-09-01']]">
      <sch:assert id="a-3259-21303-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-21303).</sch:assert>
      <sch:assert id="a-3259-21304-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-21304).</sch:assert>
      <sch:assert id="a-3259-21298-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.30'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-21298) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.30" (CONF:3259-21310). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21441).</sch:assert>
      <sch:assert id="a-3259-21294-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-21294).</sch:assert>
      <sch:assert id="a-3259-21297-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3259-21297).</sch:assert>
      <sch:assert id="a-3259-21307-error" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:3259-21307).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.30'][@extension='2016-09-01']]/cda:code">
      <sch:assert id="a-3259-21305-error" test="@code='72510-1'">This code SHALL contain exactly one [1..1] @code="72510-1" Performance Rate (CONF:3259-21305).</sch:assert>
      <sch:assert id="a-3259-21306-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3259-21306).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.30'][@extension='2016-09-01']]/cda:statusCode">
      <sch:assert id="a-3259-21309-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:3259-21309).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Performance_Rate_for_Proportion_Measure-pattern-extension-check">
    <sch:rule id="Performance_Rate_for_Proportion_Measure-extension-check" context="cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']">
      <sch:assert id="a-4484-19649-extension-error" test="@extension='2020-12-01'">SHALL contain exactly one [1..1] templateId (CONF:4484-19649) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.14" (CONF:4484-19650). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-21444).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Performance_Rate_for_Proportion_Measure-pattern-errors">
    <sch:rule id="Performance_Rate_for_Proportion_Measure-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'][@extension='2020-12-01']]">
      <sch:assert id="a-4484-18395-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4484-18395).</sch:assert>
      <sch:assert id="a-4484-18396-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4484-18396).</sch:assert>
      <sch:assert id="a-4484-19649-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'][@extension='2020-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4484-19649) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.14" (CONF:4484-19650). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-21444).</sch:assert>
      <!-- 12-01-2020 Added type requirement -->
      <sch:assert id="a-4484-21445-error" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:4484-21445).</sch:assert>
      <!-- 12-01-2020 Made reference a requirement -->
      <sch:assert id="a-4484-19651-error" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:4484-19651).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'][@extension='2020-12-01']]/cda:reference">
      <sch:assert id="a-4484-19652-error" test="@typeCode='REFR'">The reference, if present, SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4484-19652).</sch:assert>
      <sch:assert id="a-4484-19653-error" test="count(cda:externalObservation)=1">The reference, if present, SHALL contain exactly one [1..1] externalObservation (CONF:4484-19653).</sch:assert>
    </sch:rule>
    <!-- 12-01-2020 Added rules to check format of value attribute in xsi:type REAL value element -->
    <sch:rule id="Performance_Rate_for_Proportion_Measure-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'][@extension='2020-12-01']]/cda:value[@xsi:type='REAL']">
      <sch:assert id="a-4484-21446-error" test="not(@value) or (@value &gt;= 0.0 and @value &lt;=1.0)">The value, if present, SHALL be greater than or equal to 0 and less than or equal to 1 (CONF:4484-21446).</sch:assert>
      <sch:assert id="a-4484-21447-error" test="not(@value) or (string-length(normalize-space(substring-after(@value, '.'))) &lt;= 6)">The value, if present, SHALL contain no more than 6 digits to the right of the decimal (CONF:4484-21447).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'][@extension='2020-12-01']]/cda:reference/cda:externalObservation">
      <sch:assert id="a-4484-19654-error" test="@classCode">This externalObservation SHALL contain exactly one [1..1] @classCode (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4484-19654).</sch:assert>
      <sch:assert id="a-4484-19657-error" test="count(cda:code)=1">This externalObservation SHALL contain exactly one [1..1] code (CONF:4484-19657).</sch:assert>
      <sch:assert id="a-4484-19655-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:4484-19655).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-externalObservation-id-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'][@extension='2020-12-01']]/cda:reference/cda:externalObservation/cda:id">
      <sch:assert id="a-4484-19656-error" test="@root">This id SHALL contain exactly one [1..1] @root (CONF:4484-19656).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-externalObservation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'][@extension='2020-12-01']]/cda:reference/cda:externalObservation/cda:code">
      <sch:assert id="a-4484-19658-error" test="@code='NUMER'">This code SHALL contain exactly one [1..1] @code="NUMER" Numerator (CONF:4484-19658).</sch:assert>
      <sch:assert id="a-4484-21180-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:4484-21180).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'][@extension='2020-12-01']]/cda:referenceRange">
      <sch:assert id="a-4484-18401-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:4484-18401).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'][@extension='2020-12-01']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-4484-18402-error" test="count(cda:value[@xsi:type='REAL'])=1">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:4484-18402).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Postal_Code_Supplemental_Data_Element_V2-pattern-extension-check">
    <sch:rule id="Postal_Code_Supplemental_Data_Element_V2-extension-check" context="cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10']">
      <sch:assert id="a-3259-18211-extension-error" test="@extension='2016-09-01'">SHALL contain exactly one [1..1] templateId (CONF:3259-18211) such that it	SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.10" (CONF:3259-18212).	SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21446).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Postal_Code_Supplemental_Data_Element_V2-pattern-errors">
    <sch:rule id="Postal_Code_Supplemental_Data_Element_V2-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10'][@extension='2016-09-01']]">
      <sch:assert id="a-3259-18209-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-18209).</sch:assert>
      <sch:assert id="a-3259-18210-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-18210).</sch:assert>
      <sch:assert id="a-3259-18211-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-18211) such that it	SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.10" (CONF:3259-18212).	SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21446).</sch:assert>
      <sch:assert id="a-3259-18213-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-18213).</sch:assert>
      <sch:assert id="a-3259-18100-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3259-18100).</sch:assert>
      <sch:assert id="a-3259-18215-error" test="count(cda:value[@xsi:type='ST'])=1">SHALL contain exactly one [1..1] value with @xsi:type="ST" (CONF:3259-18215).</sch:assert>
      <sch:assert id="a-3259-18102-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3259-18102) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:3259-18103). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3259-18104). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:3259-18105).</sch:assert>
    </sch:rule>
    <sch:rule id="Postal_Code_Supplemental_Data_Element_V2-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10'][@extension='2016-09-01']]/cda:code">
      <sch:assert id="a-3259-18214-error" test="@code='45401-7'">This code SHALL contain exactly one [1..1] @code="45401-7" Zip code (CONF:3259-18214).</sch:assert>
      <sch:assert id="a-3259-21445-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3259-21445).</sch:assert>
    </sch:rule>
    <sch:rule id="Postal_Code_Supplemental_Data_Element_V2-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10'][@extension='2016-09-01']]/cda:statusCode">
      <sch:assert id="a-3259-18101-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:3259-18101).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Promoting_Interoperability_Measure_Performed_Reference_and_Result-pattern-errors">
    <sch:rule id="Promoting_Interoperability_Measure_Performed_Reference_and_Result-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.29'][@extension='2016-09-01']]">
      <sch:assert id="a-3259-21419-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-21419).</sch:assert>
      <sch:assert id="a-3259-21420-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-21420).</sch:assert>
      <sch:assert id="a-3259-21408-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.29'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-21408) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.29" (CONF:3259-21417). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21418).</sch:assert>
      <sch:assert id="a-3259-21405-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument)=1])=1">SHALL contain exactly one [1..1] reference (CONF:3259-21405) such that it SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:3259-21416). SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-21406).</sch:assert>
      <sch:assert id="a-3259-21404-error" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.27'][@extension='2016-09-01']])=1])=1">SHALL contain exactly one [1..1] component (CONF:3259-21404) such that it SHALL contain exactly one [1..1] Measure Performed (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.27:2016-09-01) (CONF:3259-21411)</sch:assert>
    </sch:rule>
    <sch:rule id="Promoting_Interoperability_Measure_Performed_Reference_and_Result_reference_externalDocument-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.29'][@extension='2016-09-01']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-3259-21415-error" test="@classCode='DOC'">This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3259-21415).</sch:assert>
      <sch:assert id="a-3259-21407-error" test="count(cda:id[@root='2.16.840.1.113883.3.7031'][@extension])=1">This externalDocument SHALL contain exactly one [1..1] id (CONF:3259-21407) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.7031" (CONF:3259-21412). SHALL contain exactly one [1..1] @extension (CONF:3259-21413).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Denominator-pattern-errors">
    <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Denominator-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.32'][@extension='2016-09-01']]">
      <sch:assert id="a-3259-21378-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-21378).</sch:assert>
      <sch:assert id="a-3259-21379-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-21379).</sch:assert>
      <sch:assert id="a-3259-21366-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.32'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-21366) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.32" (CONF:3259-21374). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21400).</sch:assert>
      <sch:assert id="a-3259-21365-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-21365).</sch:assert>
      <sch:assert id="a-3259-21367-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3259-21367).</sch:assert>
      <sch:assert id="a-3259-21368-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3259-21368).</sch:assert>
      <sch:assert id="a-3259-21364-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3259-21364) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:3259-21370). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3259-21371). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:3259-21369).</sch:assert>
    </sch:rule>
    <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Denominator-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.32'][@extension='2016-09-01']]/cda:code">
      <sch:assert id="a-3259-21372-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3259-21372).</sch:assert>
      <sch:assert id="a-3259-21373-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3259-21373).</sch:assert>
    </sch:rule>
    <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Denominator-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.32'][@extension='2016-09-01']]/cda:statusCode">
      <sch:assert id="a-3259-21375-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3259-21375).</sch:assert>
    </sch:rule>
    <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Denominator-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.32'][@extension='2016-09-01']]/cda:value">
      <sch:assert id="a-3259-21376-error" test="@code='DENOM'">This value SHALL contain exactly one [1..1] @code="DENOM" Denominator (CONF:3259-21376).</sch:assert>
      <sch:assert id="a-3259-21377-error" test="@codeSystem='2.16.840.1.113883.5.4'">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4 STATIC) (CONF:3259-21377).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Numerator-pattern-errors">
    <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Numerator-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.31'][@extension='2016-09-01']]">
      <sch:assert id="a-3259-21360-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-21360).</sch:assert>
      <sch:assert id="a-3259-21361-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-21361).</sch:assert>
      <sch:assert id="a-3259-21324-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.31'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-21324) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.31" (CONF:3259-21342). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21401).</sch:assert>
      <sch:assert id="a-3259-21323-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-21323).</sch:assert>
      <sch:assert id="a-3259-21332-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3259-21332).</sch:assert>
      <sch:assert id="a-3259-21336-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3259-21336).</sch:assert>
      <sch:assert id="a-3259-21322-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3259-21322) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:3259-21338). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3259-21339). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:3259-21337).</sch:assert>
    </sch:rule>
    <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Numerator-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.31'][@extension='2016-09-01']]/cda:code">
      <sch:assert id="a-3259-21340-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3259-21340).</sch:assert>
      <sch:assert id="a-3259-21341-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3259-21341).</sch:assert>
    </sch:rule>
    <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Numerator-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.31'][@extension='2016-09-01']]/cda:statusCode">
      <sch:assert id="a-3259-21358-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3259-21358).</sch:assert>
    </sch:rule>
    <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Numerator-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.31'][@extension='2016-09-01']]/cda:value">
      <sch:assert id="a-3259-21362-error" test="@code='NUMER'">This value SHALL contain exactly one [1..1] @code="NUMER" Numerator (CONF:3259-21362).</sch:assert>
      <sch:assert id="a-3259-21363-error" test="@codeSystem='2.16.840.1.113883.5.4'">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4 STATIC) (CONF:3259-21363).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results-pattern-errors">
    <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.28'][@extension='2017-06-01']]">
      <sch:assert id="a-3338-21273-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3338-21273).</sch:assert>
      <sch:assert id="a-3338-21274-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3338-21274).</sch:assert>
      <sch:assert id="a-3338-21248-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.28'][@extension='2017-06-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3338-21248) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.28" (CONF:3338-21266). SHALL contain exactly one [1..1] @extension="2017-06-01" (CONF:3338-21396).</sch:assert>
      <sch:assert id="a-3338-21242-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument)=1])=1">SHALL contain exactly one [1..1] reference (CONF:3338-21242) such that it SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:3338-21265). SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3338-21243).</sch:assert>
      <sch:assert id="a-3338-21312-error" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.31'][@extension='2016-09-01']])=1])=1">SHALL contain exactly one [1..1] component (CONF:3338-21312) such that it SHALL contain exactly one [1..1] Advancing Care Information Numerator Denominator Type Measure Numerator Data (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.31:2016-09-01) (CONF:3338-21313).</sch:assert>
      <sch:assert id="a-3338-21320-error" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.32'][@extension='2016-09-01']])=1])=1">SHALL contain exactly one [1..1] component (CONF:3338-21320) such that it SHALL contain exactly one [1..1] Advancing Care Information Numerator Denominator Type Measure Denominator Data (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.32:2016-09-01) (CONF:3338-21321).</sch:assert>
    </sch:rule>
    <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results_reference_externalDocument-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.28'][@extension='2017-06-01']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-3338-21264-error" test="@classCode='DOC'">This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3338-21264).</sch:assert>
      <sch:assert id="a-3338-21247-error" test="count(cda:id[@root='2.16.840.1.113883.3.7031'][@extension])=1">This externalDocument SHALL contain exactly one [1..1] id (CONF:3338-21247) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.7031" (CONF:3338-21402). SHALL contain exactly one [1..1] @extension (CONF:3338-21403).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Promoting_Interoperability-pattern-extension-check">
    <sch:rule id="Promoting_Interoperability-extension-check" context="cda:section/cda:templateId[@root='2.16.840.1.113883.10.20.27.2.5']">
      <sch:assert id="a-4484-21231-extension-error" test="@extension='2020-12-01'">SHALL contain exactly one [1..1] templateId (CONF:4484-21231) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.5" (CONF:4484-21233). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-21395).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Promoting_Interoperability-pattern-errors">
    <sch:rule id="Promoting_Interoperability-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.5'][@extension='2020-12-01']]">
      <sch:assert id="a-4484-21231-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.5'][@extension='2020-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4484-21231) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.5" (CONF:4484-21233). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-21395).</sch:assert>
      <!-- 11-25-2020 Updated templateID extension -->
      <sch:assert id="a-4484-21440-error" test="count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'][@extension='2020-12-01']]])=1">SHALL contain exactly one [1..1] entry (CONF:4484-21440) such that it SHALL contain exactly one [1..1] Reporting Parameters Act (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.17.3.8:2020-12-01) (CONF:4484-21441).</sch:assert>
      <sch:assert id="a-4484-21438-error" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:4484-21438).</sch:assert>
      <sch:assert id="a-4484-21439-error" test="count(cda:entry[cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.28'][@extension='2017-06-01']]]) &gt; 0 or count(cda:entry[cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.29'][@extension='2016-09-01']]]) &gt; 0">This Promoting Interoperability Section SHALL contain at least a Promoting Interoperability Numerator Denominator Type Measure Reference and Results or a Promoting Interoperability Measure Performed Reference and Results (CONF:4484-21439).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Measure-pattern-extension-check">
    <sch:rule id="QRDA_Category_III_Measure-extension-check" context="cda:section/cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1']">
      <sch:assert id="a-4484-17284-extension-error" test="@extension='2020-12-01'">SHALL contain exactly one [1..1] templateId (CONF:4484-17284) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.1" (CONF:4484-17285). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-21171).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Measure-pattern-errors">
    <sch:rule id="QRDA_Category_III_Measure-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2020-12-01']]">
      <sch:assert id="a-4484-17284-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2020-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4484-17284) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.1" (CONF:4484-17285). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-21171).</sch:assert>
      <sch:assert id="a-4484-17906-error" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2020-12-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:4484-17906) such that it SHALL contain exactly one [1..1] Measure Reference and Results (V4) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.1:2016-09-01) (CONF:4484-17907)</sch:assert>
      <!-- 11-25-2020 Updated templateId extension -->
      <sch:assert id="a-4484-21467-error" test="count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'][@extension='2020-12-01']]])=1">SHALL contain exactly one [1..1] entry (CONF:4484-21467) such that it SHALL contain exactly one [1..1] Reporting Parameters Act (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.17.3.8:2020-12-01) (CONF:4484-21468).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Report-pattern-extension-check">
    <sch:rule id="QRDA_Category_III_Report-extension-check" context="cda:ClinicalDocument/cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1']">
      <sch:assert id="a-4484-17208-extension-error" test="@extension='2020-12-01'">SHALL contain exactly one [1..1] templateId (CONF:4484-17208) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.1" (CONF:4484-17209). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-21319).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Report-pattern-errors">
    <sch:rule id="QRDA_Category_III_Report-errors" context="cda:ClinicalDocument">
      <sch:assert id="a-4484-17226-error" test="count(cda:realmCode)=1">SHALL contain exactly one [1..1] realmCode (CONF:4484-17226).</sch:assert>
      <sch:assert id="a-4484-18186-error" test="count(cda:typeId)=1">SHALL contain exactly one [1..1] typeId (CONF:4484-18186).</sch:assert>
      <sch:assert id="a-4484-17208-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4484-17208) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.1" (CONF:4484-17209). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-21319).</sch:assert>
      <sch:assert id="a-4484-17236-error" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:4484-17236).</sch:assert>
      <sch:assert id="a-4484-17210-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:4484-17210).</sch:assert>
      <sch:assert id="a-4484-17211-error" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:4484-17211).</sch:assert>
      <sch:assert id="a-4484-17237-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:4484-17237).</sch:assert>
      <sch:assert id="a-4484-17238-error" test="count(cda:confidentialityCode)=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC 2010-04-21 (CONF:4484-17238).</sch:assert>
      <sch:assert id="a-4484-17239-error" test="count(cda:languageCode)=1">SHALL contain exactly one [1..1] languageCode (CONF:4484-17239).</sch:assert>
      <sch:assert id="a-4484-17212-error" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:4484-17212).</sch:assert>
      <sch:assert id="a-4484-18156-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]) &gt; 0">SHALL contain at least one [1..*] author (CONF:4484-18156) such that it SHALL contain exactly one [1..1] time (CONF:4484-18158). SHALL contain exactly one [1..1] assignedAuthor (CONF:4484-18157).</sch:assert>
      <sch:assert id="a-4484-17213-error" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:4484-17213).</sch:assert>
      <sch:assert id="a-4484-17217-error" test="count(cda:component)=1">SHALL contain exactly one [1..1] component (CONF:4484-17217).</sch:assert>
    </sch:rule>
    <!-- realmCode related rules -->
    <sch:rule id="QRDA_Category_III_Report-typeId-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:typeId">
      <sch:assert id="a-4484-18187-error" test="@root='2.16.840.1.113883.1.3'">This typeId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.1.3" (CONF:4484-18187).</sch:assert>
      <sch:assert id="a-4484-18188-error" test="@extension='POCD_HD000040'">This typeId SHALL contain exactly one [1..1] @extension="POCD_HD000040" (CONF:4484-18188).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-realmCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:realmCode">
      <sch:assert id="a-4484-17227-error" test="@code='US'">This realmCode SHALL contain exactly one [1..1] @code="US" (CONF:4484-17227).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:code">
      <sch:assert id="a-4484-19549-error" test="@code='55184-6'">This code SHALL contain exactly one [1..1] @code="55184-6" Quality Reporting Document Architecture Calculated Summary Report (CONF:4484-19549).</sch:assert>
      <sch:assert id="a-4484-21166-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4484-21166).</sch:assert>
    </sch:rule>
    <!-- languageCode rules -->
    <sch:rule id="QRDA_Category_III_Report-languageCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:languageCode">
      <sch:assert id="a-4484-19669-error" test="@code">This languageCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Language urn:oid:2.16.840.1.113883.1.11.11526 DYNAMIC (CONF:4484-19669).</sch:assert>
    </sch:rule>
    <!-- recordTarget rules -->
    <sch:rule id="QRDA_Category_III_Report-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:recordTarget">
      <sch:assert id="a-4484-17232-error" test="count(cda:patientRole[count(cda:id[@nullFlavor='NA'])=1])=1">This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:4484-17232) such that it SHALL contain exactly one [1..1] id (CONF:4484-17233). This id SHALL contain exactly one [1..1] @nullFlavor="NA" (CONF:4484-17234).</sch:assert>
    </sch:rule>
    <!-- author rules -->
    <sch:rule id="QRDA_Category_III_Report-author-assignedAuthor-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-4484-18163-error" test="count(cda:representedOrganization)=1">This assignedAuthor SHALL contain exactly one [1..1] representedOrganization (CONF:4484-18163).</sch:assert>
      <sch:assert id="a-4484-19667-error" test="count(cda:assignedPerson)=1 or count(cda:assignedAuthoringDevice)=1">There SHALL be exactly one assignedAuthor/assignedPerson or exactly one assignedAuthor/assignedAuthoringDevice (CONF:4484-19667).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-author-assignedAuthor-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:author/cda:assignedAuthor/cda:representedOrganization">
      <sch:assert id="a-4484-18265-error" test="count(cda:name) &gt; 0">This representedOrganization SHALL contain at least one [1..*] name (CONF:4484-18265).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-author-assignedAuthor-assignedAuthoringDevice-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice">
      <sch:assert id="a-4484-18262-error" test="count(cda:softwareName)=1">The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] softwareName (CONF:4484-18262).</sch:assert>
    </sch:rule>
    <!-- custodian rules -->
    <sch:rule id="QRDA_Category_III_Report-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:custodian">
      <sch:assert id="a-4484-17214-error" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:4484-17214).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-custodian-assignedCustodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:custodian/cda:assignedCustodian">
      <sch:assert id="a-4484-17215-error" test="count(cda:representedCustodianOrganization)=1">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:4484-17215).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-custodian-assignedCustodian-representedCustodianOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
      <sch:assert id="a-4484-18165-error" test="count(cda:id) &gt; 0">This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:4484-18165).</sch:assert>
    </sch:rule>
    <!-- legalAuthenticator rules -->
    <sch:rule id="QRDA_Category_III_Report-legalAuthenticator-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:legalAuthenticator">
      <!-- 11-18-2020 added 'if present' to conformance text messages -->
      <sch:assert id="a-4484-18167-error" test="count(cda:time)=1">This legalAuthenticator, if present, SHALL contain exactly one [1..1] time (CONF:4484-18167).</sch:assert>
      <sch:assert id="a-4484-18168-error" test="count(cda:signatureCode)=1">This legalAuthenticator, if present, SHALL contain exactly one [1..1] signatureCode (CONF:4484-18168).</sch:assert>
      <sch:assert id="a-4484-19670-error" test="count(cda:assignedEntity)=1">This legalAuthenticator, if present SHALL contain exactly one [1..1] assignedEntity (CONF:4484-19670).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-legalAuthenticator-signatureCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:legalAuthenticator/cda:signatureCode">
      <!-- 11-18-2020 added STATIC oid to  conformance text message -->
      <sch:assert id="a-4484-18169-error" test="@code='S'">This signatureCode SHALL contain exactly one [1..1] @code="S" (CodeSystem: HL7ParticipationSignature urn:oid:2.16.840.1.113883.5.89 STATIC) (CONF:4484-18169).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-legalAuthenticator-assignedEntity-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-4484-19672-error" test="count(cda:id) &gt; 0">The representedOrganization, if present, SHALL contain at least one [1..*] id (CONF:4484-19672).</sch:assert>
    </sch:rule>
    <!-- participant (as device) rules -->
    <sch:rule id="QRDA_Category_III_Report-participant-associatedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:participant[@typeCode='DEV']/cda:associatedEntity">
      <sch:assert id="a-4484-18303-error" test="@classCode='RGPR'">This associatedEntity SHALL contain exactly one [1..1] @classCode="RGPR" regulated product (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4484-18303).</sch:assert>
      <sch:assert id="a-4484-20954-error" test="count(cda:id) &gt; 0">This associatedEntity SHALL contain at least one [1..*] id (CONF:4484-20954).</sch:assert>
      <sch:assert id="a-4484-18308-error" test="count(cda:code)=1">This associatedEntity SHALL contain exactly one [1..1] code (CONF:4484-18308).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-participant-DEV-associatedEntity-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:participant[@typeCode='DEV']/cda:associatedEntity/cda:code">
      <sch:assert id="a-4484-18309-error" test="@code='129465004'">This code SHALL contain exactly one [1..1] @code="129465004" medical record, device (CONF:4484-18309).</sch:assert>
      <sch:assert id="a-4484-21167-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:4484-21167).</sch:assert>
    </sch:rule>
    <!-- 11-18-2020  Added SHALL constraints for when Participant location (4484-18300) is present -->
    <sch:rule id="QRDA_Category_III_Report-participant-LOC-associatedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:participant[@typeCode='LOC']/cda:associatedEntity">
      <sch:assert id="a-4484-21454-error" test="@classCode='SDLOC'">This associatedEntity SHALL contain exactly one [1..1] @classCode="SDLOC" Service Delivery Location (CONF:4484-21454).</sch:assert>
      <sch:assert id="a-4484-21455-error" test="count(cda:id)&gt; 0">This associatedEntity SHALL contain at least one [1..*] id (CONF:4484-21455).</sch:assert>
      <sch:assert id="a-4484-21450-error" test="count(cda:code) =1">This associatedEntity SHALL contain exactly one [1..1] code (CONF:4484-21450).</sch:assert>
      <sch:assert id="a-4484-21458-error" test="count(cda:addr) =1">This associatedEntity SHALL contain exactly one [1..1] addr (CONF:4484-21458).</sch:assert>
    </sch:rule>
    <!-- participant (as location) rules -->
    <!-- 11-18-2020  Added SHALL constraints to associatedEntity code for when Participant location (4484-21448) is present -->
    <sch:rule id="QRDA_Category_III_Report-participant-LOC-associatedEntity-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:participant[@typeCode='LOC']/cda:associatedEntity/cda:code">
      <sch:assert id="a-4484-18300-21456-error" test="@code='394730007'">This code SHALL contain exactly one [1..1] @code="394730007" Healthcare Related Organization (CONF:4484-21456).</sch:assert>
      <sch:assert id="a-4484-18300-iii-2-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:4484-21457).</sch:assert>
    </sch:rule>
    <!-- documentation rules -->
    <sch:rule id="QRDA_Category_III_Report-documentationOf-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:documentationOf">
      <sch:assert id="a-4484-18171-error" test="count(cda:serviceEvent)=1">The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:4484-18171).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-documentationOf-serviceEvent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:documentationOf/cda:serviceEvent">
      <sch:assert id="a-4484-18172-error" test="@classCode='PCPR'">This serviceEvent SHALL contain exactly one [1..1] @classCode="PCPR" Care Provision (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4484-18172).</sch:assert>
      <sch:assert id="a-4484-18173-error" test="count(cda:performer) &gt; 0">This serviceEvent SHALL contain at least one [1..*] performer (CONF:4484-18173).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-documentationOf-serviceEvent-performer-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:documentationOf/cda:serviceEvent/cda:performer">
      <sch:assert id="a-4484-18174-error" test="@typeCode='PRF'">Such performers SHALL contain exactly one [1..1] @typeCode="PRF" Performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:4484-18174).</sch:assert>
      <sch:assert id="a-4484-18176-error" test="count(cda:assignedEntity)=1">Such performers SHALL contain exactly one [1..1] assignedEntity (CONF:4484-18176).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-documentationOf-serviceEvent-performer-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
      <sch:assert id="a-4484-19474-error" test="count(cda:id) &gt; 0">This assignedEntity SHALL contain at least one [1..*] id (CONF:4484-19474).</sch:assert>
      <sch:assert id="a-4484-18180-error" test="count(cda:representedOrganization)=1">This assignedEntity SHALL contain exactly one [1..1] representedOrganization (CONF:4484-18180).</sch:assert>
    </sch:rule>
    <!-- authorization rules -->
    <sch:rule id="QRDA_Category_III_Report-authorization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:authorization">
      <sch:assert id="a-4484-18360-error" test="count(cda:consent)=1">The authorization, if present, SHALL contain exactly one [1..1] consent (CONF:4484-18360).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-authorization-consent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:authorization/cda:consent">
      <sch:assert id="a-4484-18361-error" test="count(cda:id)=1">This consent SHALL contain exactly one [1..1] id (CONF:4484-18361).</sch:assert>
      <sch:assert id="a-4484-18363-error" test="count(cda:code)=1">This consent SHALL contain exactly one [1..1] code (CONF:4484-18363).</sch:assert>
      <sch:assert id="a-4484-18364-error" test="count(cda:statusCode)=1">This consent SHALL contain exactly one [1..1] statusCode (CONF:4484-18364).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-authorization-consent-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:authorization/cda:consent/cda:code">
      <sch:assert id="a-4484-19550-error" test="@code='425691002'">This code SHALL contain exactly one [1..1] @code="425691002" Consent given for electronic record sharing (CONF:4484-19550).</sch:assert>
      <sch:assert id="a-4484-21172-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:4484-21172).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-authorization-consent-statusCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:authorization/cda:consent/cda:statusCode">
      <sch:assert id="a-4484-19551-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4484-19551).</sch:assert>
    </sch:rule>
    <!-- component rules -->
    <sch:rule id="QRDA_Category_III_Report-component-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:component">
      <sch:assert id="a-4484-17235-error" test="count(cda:structuredBody)=1">This component SHALL contain exactly one [1..1] structuredBody (CONF:4484-17235).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Report-component-structuredBody-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:component/cda:structuredBody">
      <!-- 11-18-2020 Updated section names in message text -->
      <sch:assert id="a-4484-21394-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2020-12-01']])=1])=1 or count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.4'][@extension='2020-12-01']])=1])=1 or count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.5'][@extension='2020-12-01']])=1])=1">This structuredBody SHALL contain at least a QRDA Category III Measure Section (V5), or an Improvement Activity Section (V3), or an Promoting Interoperability Measure Section (V3) (CONF:4484-21394).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Race_Supplemental_Data_Element-pattern-extension-check">
    <sch:rule id="Race_Supplemental_Data_Element-extension-check" context="cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8']">
      <sch:assert id="a-3259-18225-extension-error" test="@extension='2016-09-01'">SHALL contain exactly one [1..1] templateId (CONF:3259-18225) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.8" (CONF:3259-18226). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21178).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Race_Supplemental_Data_Element-pattern-errors">
    <sch:rule id="Race_Supplemental_Data_Element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'][@extension='2016-09-01']]">
      <sch:assert id="a-3259-18223-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-18223).</sch:assert>
      <sch:assert id="a-3259-18224-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-18224).</sch:assert>
      <sch:assert id="a-3259-18225-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-18225) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.8" (CONF:3259-18226). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21178).</sch:assert>
      <sch:assert id="a-3259-18227-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-18227).</sch:assert>
      <sch:assert id="a-3259-18112-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3259-18112).</sch:assert>
      <sch:assert id="a-3259-18114-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3259-18114) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:3259-18115). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3259-18116). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:3259-18117).</sch:assert>
      <sch:assert id="a-3259-18229-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Race urn:oid:2.16.840.1.114222.4.11.836 DYNAMIC (CONF:3259-18229).</sch:assert>
    </sch:rule>
    <sch:rule id="Race_Supplemental_Data_Element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'][@extension='2016-09-01']]/cda:code">
      <sch:assert id="a-3259-18228-error" test="@code='72826-1'">This code SHALL contain exactly one [1..1] @code="72826-1" Race (CONF:3259-18228).</sch:assert>
      <sch:assert id="a-3259-21447-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3259-21447).</sch:assert>
    </sch:rule>
    <sch:rule id="Race_Supplemental_Data_Element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'][@extension='2016-09-01']]/cda:statusCode">
      <sch:assert id="a-3259-18113-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:3259-18113).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting_Rate_for_Proportion_Measure-pattern-errors">
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]">
      <sch:assert id="a-77-18411-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18411).</sch:assert>
      <sch:assert id="a-77-18412-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18412).</sch:assert>
      <sch:assert id="a-77-21157-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:77-21157) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.15" (CONF:77-21158).</sch:assert>
      <sch:assert id="a-77-18413-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18413).</sch:assert>
      <sch:assert id="a-77-18419-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18419).</sch:assert>
      <sch:assert id="a-77-18415-error" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18415).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]/cda:code">
      <sch:assert id="a-77-18414-error" test="@code='72509-3'">This code SHALL contain exactly one [1..1] @code="72509-3" Reporting Rate (CONF:77-18414).</sch:assert>
      <sch:assert id="a-77-21168-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:77-21168).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]/cda:statusCode">
      <sch:assert id="a-77-18420-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18420).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]/cda:referenceRange">
      <sch:assert id="a-77-18417-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18417).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-77-18418-error" test="count(cda:value[@xsi:type='REAL'])=1">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18418).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting_Stratum-pattern-errors">
    <sch:rule id="Reporting_Stratum-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]">
      <sch:assert id="a-77-17575-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17575).</sch:assert>
      <sch:assert id="a-77-17576-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17576).</sch:assert>
      <sch:assert id="a-77-18093-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18093) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.4" (CONF:77-18094).</sch:assert>
      <sch:assert id="a-77-17577-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17577).</sch:assert>
      <sch:assert id="a-77-17579-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-17579).</sch:assert>
      <sch:assert id="a-77-17581-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:77-17581) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:77-17582). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:77-17583). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:77-17584).</sch:assert>
      <sch:assert id="a-77-18204-error" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:77-18204).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]/cda:code">
      <sch:assert id="a-77-17578-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:77-17578).</sch:assert>
      <sch:assert id="a-77-21169-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:77-21169).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]/cda:statusCode">
      <sch:assert id="a-77-18201-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18201).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]/cda:reference">
      <sch:assert id="a-77-18205-error" test="@typeCode='REFR'">This reference SHALL contain exactly one [1..1] @typeCode="REFR" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18205).</sch:assert>
      <sch:assert id="a-77-18206-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:77-18206).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]/cda:reference/cda:externalObservation">
      <sch:assert id="a-77-18207-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:77-18207).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Sex_Supplemental_Data_Element-pattern-extension-check">
    <sch:rule id="Sex_Supplemental_Data_Element-extension-check" context="cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6']">
      <sch:assert id="a-3259-18232-extension-error" test="@extension='2016-09-01'">SHALL contain exactly one [1..1] templateId (CONF:3259-18232) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.6" (CONF:3259-18233). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21160).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Sex_Supplemental_Data_Element-pattern-errors">
    <sch:rule id="Sex_Supplemental_Data_Element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6'][@extension='2016-09-01']]">
      <sch:assert id="a-3259-18230-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-18230).</sch:assert>
      <sch:assert id="a-3259-18231-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-18231).</sch:assert>
      <sch:assert id="a-3259-18232-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-18232) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.6" (CONF:3259-18233). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21160).</sch:assert>
      <sch:assert id="a-3259-18234-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-18234).</sch:assert>
      <sch:assert id="a-3259-18124-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3259-18124).</sch:assert>
      <sch:assert id="a-3259-18236-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet ONC Administrative Sex urn:oid:2.16.840.1.113762.1.4.1 DYNAMIC (CONF:3259-18236).</sch:assert>
      <sch:assert id="a-3259-18126-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3259-18126) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:3259-18127). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3259-18128). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:3259-18129).</sch:assert>
    </sch:rule>
    <sch:rule id="Sex_Supplemental_Data_Element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6'][@extension='2016-09-01']]/cda:code">
      <sch:assert id="a-3259-18235-error" test="@code='76689-9'">This code SHALL contain exactly one [1..1] @code="76689-9" Sex assigned at birth (CONF:3259-18235).</sch:assert>
      <sch:assert id="a-3259-21163-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:3259-21163).</sch:assert>
    </sch:rule>
    <sch:rule id="Sex_Supplemental_Data_Element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6'][@extension='2016-09-01']]/cda:statusCode">
      <sch:assert id="a-3259-18125-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:3259-18125).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure-section-pattern-errors">
    <sch:rule id="Measure-section-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]">
      <sch:assert id="a-67-12801-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:67-12801) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.2" (CONF:67-12802).</sch:assert>
      <sch:assert id="a-67-12798-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:67-12798).</sch:assert>
      <sch:assert id="a-67-12799-error" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='measure section'])=1">SHALL contain exactly one [1..1] title="Measure Section" (CONF:67-12799).</sch:assert>
      <sch:assert id="a-67-12800-error" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:67-12800).</sch:assert>
      <sch:assert id="a-67-13003-error" test="count(cda:entry[cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:67-13003) such that it SHALL contain exactly one [1..1] Measure Reference (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.98) (CONF:67-16677).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure-section-code-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]/cda:code">
      <sch:assert id="a-67-19230-error" test="@code='55186-1'">This code SHALL contain exactly one [1..1] @code="55186-1" Measure Section (CONF:67-19230).</sch:assert>
      <sch:assert id="a-67-27012-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27012).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting-Parameters-Act-pattern-extension-check">
    <sch:rule id="Reporting-Parameters-Act-extension-check" context="cda:act/cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']">
      <sch:assert id="a-4484-1098-extension-error" test="@extension='2020-12-01'">SHALL contain exactly one [1..1] templateId (CONF:4484-18098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.3.8" (CONF:4484-18099). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-26552).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting-Parameters-Act-pattern-errors">
    <sch:rule id="Reporting-Parameters-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'][@extension='2020-12-01']]">
      <sch:assert id="a-4484-3269-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4484-3269).</sch:assert>
      <sch:assert id="a-4484-3270-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4484-3270).</sch:assert>
      <sch:assert id="a-4484-18098-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'][@extension='2020-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4484-18098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.3.8" (CONF:4484-18099). SHALL contain exactly one [1..1] @extension="2020-12-01" (CONF:4484-26552).</sch:assert>
      <sch:assert id="a-4484-26549-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:4484-26549).</sch:assert>
      <sch:assert id="a-4484-3272-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:4484-3272).</sch:assert>
      <sch:assert id="a-4484-3273-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:4484-3273).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting-Parameters-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'][@extension='2020-12-01']]/cda:code">
      <sch:assert id="a-4484-26550-error" test="@code='252116004'">This code SHALL contain exactly one [1..1] @code="252116004" Observation Parameters (CONF:4484-26550).</sch:assert>
      <sch:assert id="a-4484-26551-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:4484-26551).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting-Parameters-Act-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'][@extension='2020-12-01']]/cda:effectiveTime">
      <sch:assert id="a-4484-3274-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:4484-3274).</sch:assert>
      <sch:assert id="a-4484-3275-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:4484-3275).</sch:assert>
    </sch:rule>
    <!-- 12-02-02 Added constraints on effective time low value -->
    <sch:rule id="Reporting-Parameters-Act-effectiveTime-low-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'][@extension='2020-12-01']]/cda:effectiveTime/cda:low">
      <sch:assert id="a-4484-26553-error" test="@value">This low SHALL contain exactly one [1..1] @value (CONF:4484-26553).</sch:assert>
      <sch:assert id="a-4484-26554-error" test="string-length(@value) &gt;= 8">SHALL be precise to day (CONF:4484-26554).</sch:assert>
    </sch:rule>
    <!-- 12-02-02 Added constraints on effective time high value -->
    <sch:rule id="Reporting-Parameters-Act-effectiveTime-high-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'][@extension='2020-12-01']]/cda:effectiveTime/cda:high">
      <sch:assert id="a-4484-26555-error" test="@value">This high SHALL contain exactly one [1..1] @value (CONF:4484-26555).</sch:assert>
      <sch:assert id="a-4484-26556-error" test="string-length(@value) &gt;= 8">SHALL be precise to day (CONF:4484-26556).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <!--
      WARNING Patterns and Assertions
  -->
  <sch:pattern id="Improvement_Activity_Performed_Reference_and_Result-pattern-warnings">
    <sch:rule id="Improvement_Activity_Performed_Reference_and_Result-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.33'][@extension='2016-09-01']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-3259-21429-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:3259-21429).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference-pattern-warnings">
    <sch:rule id="Measure_Reference-reference-externalDocument-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-67-12997-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:67-12997).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference_and_Results-pattern-warnings">
    <sch:rule id="Measure_Reference_and_Results-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2020-12-01']]">
      <sch:assert id="a-4484-18353-warning" test="count(cda:reference[count(cda:externalObservation)=1])=1">SHOULD contain exactly one [1..1] reference (CONF:4484-18353) such that it SHALL contain exactly one [1..1] externalObservation (CONF:4484-18354).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Reference_and_Results-reference-externalDocument-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2020-12-01']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-4484-17896-warning" test="count(cda:code)=1">This externalDocument SHOULD contain zero or one [0..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:4484-17896).</sch:assert>
      <sch:assert id="a-4484-17897-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:4484-17897).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Promoting_Interoperability_Measure_Performed_Reference_and_Result-pattern-warnings">
    <sch:rule id="Promoting_Interoperability_Measure_Performed_Reference_and_Result_reference_externalDocument-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.29'][@extension='2016-09-01']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-3259-21414-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:3259-21414).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results-pattern-warnings">
    <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results-reference-externalDocument-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.28'][@extension='2017-06-01']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-3338-21263-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:3338-21263).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Report-pattern-warnings">
    <sch:rule id="QRDA_Category_III_Report-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]">
      <sch:assert id="a-4484-17238-v-warning" test="count(cda:confidentialityCode[@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.16926']/voc:code/@value])=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC 2010-04-21 (CONF:4484-17238).</sch:assert>
      <sch:assert id="a-4484-18260-warning" test="count(cda:versionNumber)=1">SHOULD contain zero or one [0..1] versionNumber (CONF:4484-18260).</sch:assert>
      <!-- 11-18-2020 legalAuthenticator changed from SHALL to SHOULD -->
      <sch:assert id="a-4484-17225-warning" test="count(cda:legalAuthenticator)=1">SHOULD contain zero or one [0..1] legalAuthenticator (CONF:4484-17225).</sch:assert>
    </sch:rule>
    <!-- custodian warnings -->
    <sch:rule id="QRDA_Category_III_Report-custodian-assignedCustodian-representedCustodianOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
      <sch:assert id="a-4484-18166-warning" test="count(cda:name)=1">This representedCustodianOrganization SHOULD contain zero or one [0..1] name (CONF:4484-18166).</sch:assert>
    </sch:rule>
    <!-- legalAuthenticator warnings -->
    <sch:rule id="QRDA_Category_III_Report-legalAuthenticator-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-4484-19673-warning" test="count(cda:name)=1">The representedOrganization, if present, SHOULD contain zero or one [0..1] name (CONF:4484-19673).</sch:assert>
    </sch:rule>
    <!-- documentationOf warnings -->
    <sch:rule id="QRDA_Category_III_Report-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-4484-19659-warning" test="count(cda:name) &gt; 0">This representedOrganization SHOULD contain zero or more [0..*] name (CONF:4484-19659).</sch:assert>
    </sch:rule>
    <!-- 11-18-2020 Added conformance rule warning  for 4484-18177 -->
    <sch:rule id="QRDA_Category_III_Report-documentationOf-serviceEvent-performer-assignedEntity-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2020-12-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
      <sch:assert id="a-4484-18177-warning" test="count(cda:id[@root='2.16.840.1.113883.4.6']) =1">This assignedEntity SHOULD contain zero or one [1..1] id (CONF:4484-18177) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.6" National Provider ID (CONF:4484-18178) MAY contain zero or one [0..1] @extension (CONF:4484-18247).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting_Stratum-pattern-warnings">
    <sch:rule id="Reporting_Stratum-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]">
      <sch:assert id="a-77-17580-warning" test="count(cda:value)=1">SHOULD contain zero or one [0..1] value (CONF:77-17580).</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
