== CONSTANTS: uuc.ijs ==

++ Syntax of a line:

<value> <unitv> [<units>] <description>

  <value>  can be calculated number (but use '/' for division, not '%').
  <unitv>  are the (elsewhere defined) units attached to <value>.
  <units>  are the nominal units, which are DEFINED by this line.
  <description>  is what should appear in the t-table.

A final '!' in <description> means "permanent hold", but '!' should not appear in the definition. It is added by TABULA to appended lines.

MKS units (and SI-units) use 'kg' not 'g' as the fundamental unit.
This is built-into uu.ijs in verb: umake, which creates noun: mks
Noun: mks is a list of the primitive SI units (=fundamental units)
WARNING: The fundamental unit of mass in SI units is not [g] but [kg].
This means that scaleunits_cal_ gives [g] and [kg] special treatment.
The first 11 lines of UUC define fundamental units in terms of themselves.
They are not "real" definitions: their conversion factor will always be 1. 
They serve here as appendable lines for the sake of completeness.

Temperature scales: '1 F.dgr' and '1 C.dgr' are RANGES, not TEMPERATURES.
--e.g '1 C.dgr' is equivalent to a rise in temperature of 1 K
--but '1 degC' is equivalent to a temperature (absol) of 274.16 K
Temperatures in [degC] [degF] [Celsius] [Centigrade] and [Fahrenheit]
have their converted values decremented at display-time, to deduct the
absolute temperature of their zero-points.

== FORMULAS: uuf.ijs ==

++ Syntax of a line:
   <formula>                  [<units>] <desc>
   <formula> : <dependencies> [<units>] <desc>
   <formula> ; <dependencies> [<units>] <desc>

Put ';' in place of ':' to require evaluation in the given units only.
This must be done if the formula is UNITS-SPECIFIC, eg it contains
a numeric value standing for a physical (dimensioned) constant,
which would not be valid for vars expressed in different units.

++ Examples of UNITS-SPECIFIC formulas:

a*3.281 ; a(m) [ft]  (3.281 DEMANDS a in [m], result in [ft])
u+(t*9.812865328) ; u(m/s),t(s) [m/s]  (const has units [ft/s^2])

Using ':' declares that the formula is valid for vars in ANY units.
This can be guaranteed by supplying as vars any physical constants.
Use of PI, PI2, etc, does not make a formula UNITS-SPECIFIC,
because such constants are dimensionless.

++ Examples of UNITS-FREE formulas:

abs a [/]
a/b : a(m),b(s) [m/s]
   --units used only to check compatibility.
u+(t*f) : u(m/s),t(s),f(m/s^2) [m/s]
   --f will be converted as needed.
If units not specified for a given var (say a) then a(*) assumed.
