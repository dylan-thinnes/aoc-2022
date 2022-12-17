import scala.io.StdIn;
import scala.io.Source;
import scala.util.matching.Regex;
import scala.collection.mutable.Queue;

// Extractors, for fun
object IntExt { def unapply(src: String): Option[Int] = src.toIntOption }
object IntExtO { def unapply(src: String): Option[Option[Int]] = Some(src.toIntOption) }

sealed trait Operator {
  def run(l: BigInt, r: BigInt): BigInt
}
object Operator {
  def unapply(src: String): Option[Operator] = {
    src match {
      case "+" => Some(Add())
      case "*" => Some(Multiply())
      case _ => None
    }
  }
}
case class Multiply() extends Operator {
  def run(l: BigInt, r: BigInt) = l * r
}
case class Add() extends Operator {
  def run(l: BigInt, r: BigInt) = l + r
}

object Equation {
  def unapply(src: String): Option[Equation] = {
    val s"${IntExtO(l)} ${Operator(op)} ${IntExtO(r)}" = src
    Some(Equation(l.map(BigInt.apply), op, r.map(BigInt.apply)))
  }
}
class Equation(l: Option[BigInt], op: Operator, r: Option[BigInt]) {
  def run(old: BigInt): BigInt = {
    op.run(l getOrElse old, r getOrElse old)
  }
}

object Monkey {
  def fromLines(lines: Seq[String]): Monkey = {
    val header +: startingItems +: equationSrc +: test +: trueSrc +: falseSrc +: rest
          = lines
    val s"Monkey ${IntExt(id)}:" = header
    val s"  Starting items: ${itemSrc}" = startingItems
    val items: Queue[Int] = Queue.from(itemSrc.split(", ").map(_.toInt))
    val s"  Operation: new = ${Equation(equation)}" = equationSrc
    val s"  Test: divisible by ${IntExt(divisor)}" = test
    val s"    If true: throw to monkey ${IntExt(trueMonkey)}" = trueSrc
    val s"    If false: throw to monkey ${IntExt(falseMonkey)}" = falseSrc
    Monkey(id, items.map(BigInt.apply), equation, BigInt(divisor), trueMonkey, falseMonkey)
  }
}
class Monkey(id: Int, var items: Queue[BigInt], equation: Equation, val divisor: BigInt, trueMonkey: Int, falseMonkey: Int) {
  var inspections: BigInt = 0

  def takeTurn (): Queue[(BigInt, Int)] = {
    val actions = for {
      item <- items
    } yield {
      val newWorry = equation.run(item)
      val nextMonkey = if (newWorry % divisor == 0) trueMonkey else falseMonkey
      inspections += 1
      (newWorry, nextMonkey)
    }
    items = Queue()
    return actions
  }

  def report () = {
    println(s"Monkey $id: $inspections")
    for (item <- items) println(item)
  }
}

class Monkeys(var monkeys: Seq[Monkey]) {
  def normalizer: BigInt = monkeys.map(_.divisor).product

  def takeRound () = {
    for {
      monkey <- monkeys
      (newWorry, nextMonkey) <- monkey.takeTurn()
    } {
      monkeys(nextMonkey).items.append(newWorry % normalizer)
    }
  }

  def report () = {
    for (monkey <- monkeys) monkey.report()
    val mon1 +: mon2 +: _ = monkeys.sortBy(_.inspections).toList.reverse
    println(s"Score: ${mon1.inspections * mon2.inspections}")
  }
}

@main
def main() = {
  val groupedLines = Source.fromFile("/dev/stdin").getLines.grouped(7)
  val monkeys = Monkeys(groupedLines.map(Monkey.fromLines(_)).toSeq)
  monkeys.report()
  for (i <- 0 until 10000) {
    println(s"Round $i")
    monkeys.takeRound()
    monkeys.report()
  }
}
