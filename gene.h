#include <string>
#include <random>
#include <memory>
#include <vector>
#include <algorithm>
#include <sstream>

const uint8_t op_size = 6;

const char possible_ops[op_size] = {
    '+',
    '-',
    '<',
    '>',
    '[',
    ']',
};

struct Creature
{
  static const uint8_t chance = 250;

  std::string code;

  void GenerateCode();
  std::string Recompile();
};

struct Incubator
{
  std::vector<std::shared_ptr<Creature>> creatures;

  void Evolve();

private:
  static bool CreatureCompare(std::pair<std::shared_ptr<Creature>, int> &, std::pair<std::shared_ptr<Creature>, int> &);
  static int DistanceReward(const int, int);
};

std::shared_ptr<Creature> Breed(std::shared_ptr<Creature> &, std::shared_ptr<Creature> &);