#include "gene.h"
#include "bf.h"
#include <iostream>

void Creature::GenerateCode()
{
  std::random_device rnd;
  std::mt19937 mt(rnd());
  std::uniform_int_distribution<int> chance_out(0, 256);
  std::uniform_int_distribution<unsigned int> rand_op(0, op_size - 1);

  size_t i = 0;
  while ((i > 0 || !(chance_out(mt) > chance)) && i <= 20)
  {
    code.push_back(possible_ops[rand_op(mt)]);
    ++i;
  }
}

std::string Creature::Recompile()
{
  std::stringstream ss;
  auto env = BFEnvironment();

  auto r = env.Read(code);
  auto ip = env.Transform(r);

  for (auto const &i : ip)
  {
    ss << i->Recompile();
  }

  return ss.str();
}

std::shared_ptr<Creature> Breed(std::shared_ptr<Creature> &c1, std::shared_ptr<Creature> &c2)
{
  std::random_device rnd;
  std::mt19937 mt(rnd());
  std::uniform_int_distribution<int> mutation(0, 256);
  std::uniform_int_distribution<int> baby_gene_take(0, 4);
  std::uniform_int_distribution<unsigned int> rand_op(0, op_size);

  auto baby = std::make_shared<Creature>();
  baby->code = std::string(c1->code);

  auto reading = false;

  for (size_t i = 0; i < baby->code.size(); ++i)
  {
    auto mut = mutation(mt);
    //std::cout << rand_op(mt) << std::endl;

    if (mut == 1)
    {
      baby->code[i] = possible_ops[rand_op(mt)];
    }
    else if (mut == 2)
    {
      baby->code = baby->code.erase(i, 1);
    }

    if (baby_gene_take(mt) == 0)
    {
      reading = !reading;
    }

    if (reading && i <= c2->code.size())
    {
      baby->code[i] = c2->code[i];
    }
  }

  return baby;
}

bool Incubator::CreatureCompare(std::pair<std::shared_ptr<Creature>, int> &r1, std::pair<std::shared_ptr<Creature>, int> &r2)
{
  return r1.second > r2.second;
}

int Incubator::DistanceReward(const int target, int c)
{
  auto dist = abs(target - c);

  return 256 - dist;
}

void Incubator::Evolve()
{
  std::vector<std::pair<std::shared_ptr<Creature>, int>> creature_rankings;
  for (auto &creature : creatures)
  {
    auto env = BFEnvironment();

    auto r = env.Read(creature->code);
    auto ip = env.Transform(r);

    env.memory[0] = 10;

    for (auto &i : ip)
    {
      i->Execute(env);
    }

    long reward = 0;

    for (size_t i = 0; i < 10; ++i)
    {
      if (i % 3 == 0)
        reward += env.memory[i];
      else
        reward -= env.memory[i];
    }

    std::cout << creature->code.size() << std::endl;

    reward = reward - creature->code.size();

    if (creature->code.empty() || env.exception)
    {
      reward = -1000;
    }

    std::cout << "Reward: " << static_cast<long>(reward) << std::endl;

    creature_rankings.emplace_back(std::pair<std::shared_ptr<Creature>, int>(creature, reward));
  }

  std::sort(creature_rankings.begin(), creature_rankings.end(), CreatureCompare);

  int percentage = creatures.size() / 2;

  std::cout << percentage << std::endl;

  creatures.clear();

  for (size_t i = 0; i < percentage; ++i)
  {
    creatures.push_back(creature_rankings[i].first);
  }

  std::random_shuffle(creatures.begin(), creatures.end());

  for (size_t i = 0; i < creatures.size(); i += 2)
  {
    auto p1 = creatures[i];
    auto p2 = creatures[i + 1];

    std::cout << creatures.size() << " " << i + 1 << std::endl;
    creatures.push_back(Breed(p1, p2));
  }
}